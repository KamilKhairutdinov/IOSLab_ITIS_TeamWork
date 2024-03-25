//
//  ProfileViewController.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

import UIKit
import SnapKit
import SDWebImage

// MARK: - Бородач Евгения
class ProfileViewController: UIViewController, FlowController {
    // MARK: - Declaration objects
    var completionHandler: (() -> Void)?
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
    /// будет использоваться для получения картинок из сети, пока просто мок пример
    private func getImage() -> UIImageView {
        let imageView = UIImageView()
        let url = getURL()
        imageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "scribble.variable"))
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit

        return imageView
    }

    /// будет использоваться для получения картинок из сети, пока просто мок пример
    private func getURL() -> URL {
        let url = URLBuilder()
            .with(host: "avatars.mds.yandex.net")
            .with(path: "/get-mpic/5332815/img_id5910357100315851824.jpeg/600x800")
            .with(scheme: .https)
            .build()

        return url
    }

    private func configureUIItems() {
        nameLabel = labelFactory.createDefaultLabel(text: "Имя Имьевич", fontSize: 25, weight: .bold)
        userIconImage = getImage()
        changeProfileLabel = labelFactory.createDefaultLabel(text: "Изменить профиль", color: .lightGray, fontSize: 20)
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
        navigationItem.title = "Профиль"
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
}
