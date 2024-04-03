//
//  ValidationService.swift
//  Bookshelf
//
//  Created by Rustem on 24.03.2024.
//

import Foundation

// MARK: - Уваров Тимур

class ValidationService: ValidationServiceProtocol {
    private var validationErrors: [String]

    init() {
        validationErrors = []
    }

    func validateUser(_ email: String, _ password: String, _ passwordConfirmation: String) -> [String] {
        validationErrors = []

        if email.count == 0 {
            validationErrors.append("Почта не может быть пустой!")
        }

        if password.count == 0 {
            validationErrors.append("Пароль не может быть пустой!")
        }

        if !validationErrors.isEmpty {
            return validationErrors
        } else {
            if !isValidEmail(email) {
                validationErrors.append("Неверный формат почты")
            }

            if !isValidPassword(password) {
                validationErrors.append("Пароль должен быть не короче 6 знаков")
            }

            if password != passwordConfirmation {
                validationErrors.append("Пароли не совпадают")
            }
            return validationErrors
        }
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    private func isValidPassword(_ password: String) -> Bool {
        return password.count > 5
    }
}
