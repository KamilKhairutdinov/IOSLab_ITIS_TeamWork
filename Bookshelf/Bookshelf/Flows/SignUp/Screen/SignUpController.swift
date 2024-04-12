//
//  SignUpController.swift
//  Bookshelf
//
//  Created by Rustem on 24.03.2024.
//

import UIKit

// MARK: - Уваров Тимур
final class SignUpController: UIViewController, FlowController {

    private let textFieldFactory = TextFieldFactory()
    // MARK: - UI elements
    private lazy var emailTextField: UITextField = {
        let textField = textFieldFactory.createSignUpTextField(placeholder: "Почта")
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        textField.delegate = self
        textField.accessibilityIdentifier = "emailSignUpTextField"

        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = textFieldFactory.createSignUpTextField(placeholder: "Пароль")
        textField.isSecureTextEntry = true
        textField.returnKeyType = .next
        textField.delegate = self
        textField.passwordRules = .none
        textField.accessibilityIdentifier = "passwordSignUpTextField"

        return textField
    }()

    private lazy var passwordConfirmationTextField: UITextField = {
        let textField = textFieldFactory.createSignUpTextField(placeholder: "Повторите пароль")
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
        textField.delegate = self
        textField.passwordRules = .none
        textField.accessibilityIdentifier = "passwordConfirmationSignUpTextField"

        return textField
    }()

    private lazy var validationErrorsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Тестовый ошибка"

        return label
    }()

    private lazy var nextButton: UIButton = {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.viewModel.signUpUser(
                self.emailTextField.text,
                self.passwordTextField.text,
                self.passwordConfirmationTextField.text
            )
        }
        let button = UIButton(configuration: .filled())
        button.setTitle("Зарегистрироваться", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.backgroundColor = .systemBlue
        button.addAction(action, for: .touchUpInside)
        button.accessibilityIdentifier = "signUp"
        return button
    }()

    // MARK: - Variables
    var completionHandler: (() -> Void)?
    private let viewModel: SignUpViewModel

    // MARK: - Init
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Регистрация"
        configureUI()
        setupBindings()
    }

    private func configureUI() {

        let stackView = UIStackView(arrangedSubviews: [
            passwordTextField, emailTextField,
            passwordConfirmationTextField, nextButton,
            validationErrorsLabel])
        stackView.axis = .vertical
        stackView.spacing = 20

        view.addSubview(nextButton)
        view.addSubview(passwordTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordConfirmationTextField)
        view.addSubview(validationErrorsLabel)

        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60),

            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 60),

            passwordConfirmationTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordConfirmationTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordConfirmationTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),

            validationErrorsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            validationErrorsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            validationErrorsLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -10),

            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension SignUpController {

    private func setupBindings() {
        viewModel.isSuccessfulRegistered.bind({ [weak self] (isSuccessfulRegistered) in
            if isSuccessfulRegistered {
                guard let self else { return }
                self.completionHandler?()
            }
        })

        viewModel.errorStringFormatted.bind({ [weak self] (errorStringFormatted) in
            guard let self else { return }
            self.validationErrorsLabel.text = errorStringFormatted
        })
    }
}

extension SignUpController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordConfirmationTextField.becomeFirstResponder()
        case passwordConfirmationTextField:
            view.endEditing(true)
        default:
            break
        }
        return true
    }
}
