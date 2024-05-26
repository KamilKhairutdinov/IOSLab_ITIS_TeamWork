//
//  ProfileViewController.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

import UIKit
import SnapKit
import SDWebImage
import Combine
import SwiftUI

enum ProfileStatus {
    case logOut
}

// MARK: - Бородач Евгения
// Кирилл Абрамов переделал
class ProfileViewController: UIViewController, FlowControllerWithValue {
    // MARK: - Declaration objects
    var completionHandler: ((ProfileStatus) -> Void)?
    private var viewModel: ProfileViewModel
    private let buttonFactory = ButtonFactory()
    private let labelFactory = LabelFactory()
    var cancellables = Set<AnyCancellable>()

    private lazy var changeProfileButton: UIButton = {
        let button = UIButton(configuration: .plain())
        button.setTitle("Редактировать профиль", for: .normal)
        button.tintColor = .systemBlue
        let action = UIAction { [weak self] _ in
            self?.showEditProfileView()
        }
        button.addAction(action, for: .touchUpInside)

        return button
    }()

    private lazy var userIconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = view.frame.width / 4

        return imageView
    }()

    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black

        return label
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black

        return label
    }()

    // MARK: - Init
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.getUserData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getUserData()
    }

    // MARK: - Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setBindings()
    }
}

// MARK: - Support things
extension ProfileViewController {
    private func addSubviews(_ views: [UIView]) {
        for view in views {
            self.view.addSubview(view)
        }
    }
}

// MARK: - Snap kit
extension ProfileViewController {
    private func configureUI() {
        let image = UIImage(systemName: "rectangle.portrait.and.arrow.forward")
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(buttonTapped))

        navigationItem.title = "Профиль"
        navigationItem.leftBarButtonItem = button
        view.backgroundColor = .white

        let mainStackView = UIStackView(arrangedSubviews: [
            userIconImage,
            emailLabel,
            nameLabel,
            changeProfileButton
        ])

        mainStackView.axis = .vertical
        mainStackView.spacing = 10
        mainStackView.alignment = .center

        addSubviews([mainStackView])

        userIconImage.snp.makeConstraints { make in
            make.width.height.equalTo(200)
        }
        mainStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
        }
    }

    @objc private func buttonTapped() {
        viewModel.logOut()
        self.completionHandler?(.logOut)
    }
}

// Кирилл Абрамов
extension ProfileViewController {
    private func setBindings() {
        viewModel.$userModel
            .receive(on: DispatchQueue.main)
            .sink { [weak self] user in
                guard let self else { return }
                self.configureProfile(with: user)
            }
            .store(in: &cancellables)
    }
}

extension ProfileViewController {
    private func showEditProfileView() {
        let editProfileViewModel = EditProfileViewModel(
            name: nameLabel.text ?? "",
            profileImage: userIconImage.image
        )

        editProfileViewModel.onSave = { [weak self] updatedName, updatedImage in
            self?.nameLabel.text = updatedName
            self?.userIconImage.image = updatedImage
            self?.viewModel.setUserData(image: self?.userIconImage.image?.jpegData(compressionQuality: 0.15), name: updatedName)
        }
        let editProfileView = EditProfileView(viewModel: editProfileViewModel)
        let hostingController = UIHostingController(rootView: editProfileView)
        navigationController?.pushViewController(hostingController, animated: true)
    }
}

extension ProfileViewController {
    func configureProfile(with user: UserModel) {
        nameLabel.text = user.name
        emailLabel.text = user.email
        if let imageData = user.avatarData {
            userIconImage.image = UIImage(data: imageData)
        } else {
            userIconImage.image = UIImage.profileIcon
        }
    }
}
