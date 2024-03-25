//
//  SignInViewController.swift
//  Bookshelf
//
//  Created by kerik on 24.03.2024.
//

import UIKit
import SnapKit

// MARK: - Абрамов Кирилл
class SignInViewController: UIViewController, FlowController {

    private let buttonFactory = ButtonFactory()
    var completionHandler: (() -> Void)?
    private var viewModel: SignInViewModel

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Почта"
        textField.layer.cornerRadius = 8
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        textField.delegate = self
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.layer.cornerRadius = 8
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
        textField.delegate = self
        textField.passwordRules = .none
        return textField
    }()

    private lazy var signInButton: UIButton = {
        let action = UIAction {_ in
            self.completionHandler?()
        }
        let button = buttonFactory.createBorderedButton(title: "Войти", color: .clear, action: action)
        return button
    }()

    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
}

extension SignInViewController {
    private func configureUI() {
        navigationItem.title = "Вход"

        let stackView = UIStackView(arrangedSubviews: [
            emailTextField,
            passwordTextField
        ])

        stackView.axis = .vertical
        stackView.spacing = 20

        view.addSubview(stackView)
        view.addSubview(signInButton)

        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(50)
        }

        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(emailTextField)
            make.bottom.equalToSuperview().inset(50)
        }
    }
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            view.endEditing(true)
        default:
            break
        }
        return true
    }
}
