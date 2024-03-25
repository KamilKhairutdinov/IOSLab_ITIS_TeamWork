//
//  LibraryViewController.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

import UIKit
import SnapKit

// MARK: - Бородач Евгения
class LibraryViewController: UIViewController, FlowController {
    // MARK: - Declaration objects
    var completionHandler: (() -> Void)?
    private var viewModel: LibraryViewModel
    private let buttonFactory = ButtonFactory()

    // MARK: - Init
    init(viewModel: LibraryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

// MARK: - Snap kit
extension LibraryViewController {
    private func configureUI() {
        navigationItem.title = "Ваша библиотека"
        view.backgroundColor = .white
    }
}
