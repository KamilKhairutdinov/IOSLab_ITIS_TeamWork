//
//  ProfileViewController.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

import UIKit
import SnapKit
import SDWebImage

enum ProfileStatus {
    case logOut
}

// MARK: - Бородач Евгения
class ProfileViewController: UIViewController, FlowControllerWithValue {
    // MARK: - Declaration objects
    var completionHandler: ((ProfileStatus) -> Void)?
    private var viewModel: ProfileViewModel
    private let buttonFactory = ButtonFactory()
    private let labelFactory = LabelFactory()

    private lazy var nameLabel = UILabel()
    private lazy var userIconImage = UIImageView()
    private lazy var changeProfileLabel = UILabel()

    // MARK: - Init
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIItems()
        configureUI()
    }
}

// MARK: - Configure ui items
extension ProfileViewController {
    private func configureUIItems() {
        let image = viewModel.getImage()
        let name = "Имя Имьевич"
        let change = "Изменить профиль"
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFit

        userIconImage = image
        nameLabel = labelFactory.createDefaultLabel(text: name, fontSize: 25, weight: .bold)
        changeProfileLabel = labelFactory.createDefaultLabel(text: change, color: .lightGray, fontSize: 20)
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
            nameLabel,
            changeProfileLabel
        ])

        mainStackView.axis = .vertical
        mainStackView.spacing = 10
        mainStackView.alignment = .center

        addSubviews([mainStackView])

        userIconImage.snp.makeConstraints { make in
            make.width.height.equalTo(300)
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
