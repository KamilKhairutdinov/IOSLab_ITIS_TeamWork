//
//  AuthViewController.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import UIKit

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
    }
}

extension AuthViewController {

}
