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
    private let signInService = SignInService()

    init() {
        validationError = Observable("")
        isSuccessfullyLoggedIn = Observable(false)
        firebaseError = Observable("")
    }

    func signInUser(email: String?, password: String?) {
        guard let email, let password else { return }
        validationError.value = ""
        if email.isEmpty || password.isEmpty {
            validationError.value = "Поля не должны быть пустыми"
        } else {
            signInService.signIn(email: email, password: password) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success:
                    self.isSuccessfullyLoggedIn.value = true
                case .failure(let error):
                    firebaseError.value = error.localizedDescription
                }
            }
        }
    }
}
