//
//  SignInViewController.swift
//  Bookshelf
//
//  Created by kerik on 24.03.2024.
//

import UIKit
import SnapKit
import Combine

// MARK: - Абрамов Кирилл
class SignInViewController: UIViewController, FlowController {

    private let buttonFactory = ButtonFactory()
    var completionHandler: (() -> Void)?
    private var viewModel: SignInViewModel
    var cancellables = Set<AnyCancellable>()

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Почта"
        textField.layer.cornerRadius = 8
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        textField.delegate = self
        textField.accessibilityIdentifier = "emailTextField"
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
        textField.accessibilityIdentifier = "passwordTextField"
        return textField
    }()

    private lazy var validationErrorsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 14)
        label.accessibilityIdentifier = "errorsLabel"
        return label
    }()

    private lazy var signInButton: UIButton = {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.viewModel.signInUser(email: emailTextField.text, password: passwordTextField.text)
        }
        let button = buttonFactory.createBorderedButton(title: "Войти", color: .clear, action: action)
        button.accessibilityIdentifier = "signIn"
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
        setupBindings()
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
        view.addSubview(validationErrorsLabel)

        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(50)
        }

        validationErrorsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(stackView.snp_bottomMargin).offset(50)
        }

        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(emailTextField)
            make.bottom.equalToSuperview().inset(50)
        }
    }
}

extension SignInViewController {
    // MARK: - Combine
    private func setupBindings() {
        viewModel.$validationError
            .receive(on: DispatchQueue.main)
            .sink { [weak self] validationError in
                guard let self = self else { return }
                self.validationErrorsLabel.text = validationError
            }
            .store(in: &cancellables)

        viewModel.$isSuccessfullyLoggedIn
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isSuccessfullyLoggedIn in
                if isSuccessfullyLoggedIn {
                    guard let self else { return }
                    self.completionHandler?()
                }
            }
            .store(in: &cancellables)

        viewModel.$firebaseError
            .receive(on: DispatchQueue.main)
            .sink { [weak self] firebaseError in
                guard let self = self else { return }
                self.validationErrorsLabel.text = firebaseError
            }
            .store(in: &cancellables)
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
