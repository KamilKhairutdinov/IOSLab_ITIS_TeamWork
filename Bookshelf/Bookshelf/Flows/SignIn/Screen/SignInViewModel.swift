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

    init() {
        validationError = Observable("")
        isSuccessfullyLoggedIn = Observable(false)
    }
    // TODO: реализовать
}
