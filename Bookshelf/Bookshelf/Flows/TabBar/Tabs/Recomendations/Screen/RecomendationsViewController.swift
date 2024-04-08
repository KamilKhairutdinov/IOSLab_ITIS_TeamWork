//
//  RecomendationsViewController.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

import UIKit
import SDWebImage
import SnapKit

// MARK: - Бородач Евгения
class RecomendationsViewController: UIViewController, FlowController {
    // MARK: - Declaration objects
    var completionHandler: (() -> Void)?
    private var viewModel: RecomendationsViewModel
    private let buttonFactory = ButtonFactory()
    private let labelFactory = LabelFactory()

    private lazy var recomendedLabel = UILabel()
    private lazy var recomendedBookImage = UIImageView()
    private lazy var recomendedBookNameLabel = UILabel()
    private lazy var recomendedBookDescrLabael = UILabel()
    private lazy var categoriesLabel = UILabel()
    private lazy var businessCategoryLabel = UILabel()
    private lazy var cultureCategoryLabel = UILabel()

    // MARK: - Init
    init(viewModel: RecomendationsViewModel) {
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
        recomendedBookImage.accessibilityIdentifier = "recomendedBookImage"
        // viewModel.setImageLink()
    }
}

// MARK: - Configure ui items
extension RecomendationsViewController {
    private func configureUIItems() {
        let image = viewModel.getImage()
        recomendedBookImage = image

        recomendedLabel = labelFactory.createDefaultLabel(text: "Для Вас", fontSize: 25, weight: .bold)
        recomendedBookNameLabel = labelFactory.createDefaultLabel(text: "Книга")
        recomendedBookDescrLabael = labelFactory.createDefaultLabel(text: "Крутая", color: .lightGray, fontSize: 17)
        categoriesLabel = labelFactory.createDefaultLabel(text: "Категории", fontSize: 25, weight: .bold)
        businessCategoryLabel = labelFactory.createDefaultLabel(text: "Бизнес", color: .blue, weight: .bold)
        cultureCategoryLabel = labelFactory.createDefaultLabel(text: "Культура", color: .blue, weight: .bold)
    }
}

// MARK: - Support things
extension RecomendationsViewController {
    private func addSubviews(_ views: [UIView]) {
        for view in views {
            self.view.addSubview(view)
        }
    }
}

// MARK: - Snap kit
extension RecomendationsViewController {
    private func configureUI() {
        navigationItem.title = "Рекомендации"
        view.backgroundColor = .white

        let stackViewBook = UIStackView(arrangedSubviews: [
            recomendedBookImage,
            recomendedBookNameLabel,
            recomendedBookDescrLabael
        ])
        let stackViewCategories = UIStackView(arrangedSubviews: [
            businessCategoryLabel,
            cultureCategoryLabel
        ])

        stackViewBook.axis = .vertical
        stackViewBook.spacing = 5
        stackViewBook.alignment = .leading
        stackViewCategories.axis = .horizontal
        stackViewCategories.spacing = 15
        stackViewCategories.alignment = .leading

        addSubviews([recomendedLabel, stackViewBook, categoriesLabel, stackViewCategories])

        recomendedLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(100)
        }
        recomendedBookImage.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(170)
        }
        stackViewBook.snp.makeConstraints { make in
            make.leading.equalTo(recomendedLabel).offset(5)
            make.top.equalTo(recomendedLabel.snp.bottom).offset(20)
        }
        categoriesLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(recomendedLabel)
            make.top.equalTo(stackViewBook.snp.bottom).offset(15)
        }
        stackViewCategories.snp.makeConstraints { make in
            make.top.equalTo(categoriesLabel.snp.bottom).offset(20)
            make.leading.equalTo(stackViewBook)
        }
    }
}
