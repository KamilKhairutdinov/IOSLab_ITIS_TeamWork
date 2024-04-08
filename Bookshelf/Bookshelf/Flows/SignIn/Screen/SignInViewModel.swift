//
//  SignInViewModel.swift
//  Bookshelf
//
//  Created by kerik on 24.03.2024.
//

import Foundation

// MARK: - Абрамов Кирилл
class SignInViewModel {
    @Published var validationError: String
    @Published var isSuccessfullyLoggedIn: Bool
    @Published var firebaseError: String
    private let authService: AuthServiceProtocol

    init() {
        validationError = ""
        isSuccessfullyLoggedIn = false
        firebaseError = ""
        authService = AuthService.shared
    }

    func signInUser(email: String?, password: String?) {
        guard let email, let password else { return }
        validationError = ""
        if email.isEmpty || password.isEmpty {
            validationError = "Поля не должны быть пустыми"
        } else {
            authService.signIn(email: email, password: password) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success:
                    isSuccessfullyLoggedIn = true
                case .failure(let error):
                    firebaseError = error.localizedDescription
                }
            }
        }
    }
}
