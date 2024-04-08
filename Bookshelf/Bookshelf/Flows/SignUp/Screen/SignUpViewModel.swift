//
//  SignUpViewModel.swift
//  Bookshelf
//
//  Created by Rustem on 24.03.2024.
//

import Foundation
import FirebaseAuth

// MARK: - Уваров Тимур
class SignUpViewModel {

    var isSuccessfulRegistered: Observable<Bool>
    var errorStringFormatted: Observable<String>
    private var email: String
    private var password: String
    private let authService: AuthServiceProtocol
    private var validationService: ValidationServiceProtocol

    init() {
        isSuccessfulRegistered = Observable(false)
        errorStringFormatted = Observable("")
        validationService = ValidationService()
        authService = AuthService.shared
        password = ""
        email = ""
    }

    func signUpUser(_ email: String?, _ password: String?, _ passwordConfirmation: String?) {
        guard let email, let password, let passwordConfirmation else { return }
        self.email = email
        self.password = password

        errorStringFormatted.value = ""
        let errors = validationService.validateUser(email, password, passwordConfirmation)

        if errors.isEmpty {
            authService.signUp(email: email, password: password) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success:
                    self.isSuccessfulRegistered.value = true
                case .failure(let error):
                    print(error)
                    self.errorStringFormatted.value = error.localizedDescription
                    self.isSuccessfulRegistered.value = false
                }
            }
        } else {
            formatErrors(errors)
        }
    }

    private func formatErrors(_ errors: [String]) {
        errors.forEach { error in
            errorStringFormatted.value += error
        }
    }
}

