//
//  SignInViewModel.swift
//  Bookshelf
//
//  Created by kerik on 24.03.2024.
//

import Foundation

// MARK: - Абрамов Кирилл
class SignInViewModel {
    var validationError: Observable<String>
    var isSuccessfullyLoggedIn: Observable<Bool>
    var firebaseError: Observable<String>
    private let authService: AuthServiceProtocol

    init() {
        validationError = Observable("")
        isSuccessfullyLoggedIn = Observable(false)
        firebaseError = Observable("")
        authService = AuthService.shared
    }

    func signInUser(email: String?, password: String?) {
        guard let email, let password else { return }
        validationError.value = ""
        if email.isEmpty || password.isEmpty {
            validationError.value = "Поля не должны быть пустыми"
        } else {
            authService.signIn(email: email, password: password) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success:
                    isSuccessfullyLoggedIn.value = true
                case .failure(let error):
                    firebaseError.value = error.localizedDescription
                }
            }
        }
    }
}
