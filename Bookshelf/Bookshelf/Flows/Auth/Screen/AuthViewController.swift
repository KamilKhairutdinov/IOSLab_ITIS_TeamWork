//
//  AuthViewController.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import UIKit
import SnapKit

enum AuthStates {
    case signIn, singUp
}

// MARK: - Хайрутдинов Камил
class AuthViewController: UIViewController, FlowControllerWithValue {

    // MARK: - UI elements
    private lazy var signInButton: UIButton = {
        let button = UIButton(configuration: .bordered())
        button.setTitle("Войти", for: .normal)

        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.completionHandler?(.signIn)
        }
        button.addAction(action, for: .touchDown)

        return button
    }()

    private lazy var signUpButton: UIButton = {
        let button = UIButton(configuration: .bordered())
        button.setTitle("Зарегистрироваться", for: .normal)

        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.completionHandler?(.singUp)
        }
        button.addAction(action, for: .touchDown)

        return button
    }()
    // MARK: - Variables
    var completionHandler: ((AuthStates) -> Void)?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
}

extension AuthViewController {
    private func configureUI() {
        let stackView = UIStackView(arrangedSubviews: [signInButton, signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(40)
        }
    }
}
