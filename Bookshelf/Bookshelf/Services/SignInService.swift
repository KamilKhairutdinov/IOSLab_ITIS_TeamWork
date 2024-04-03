//
//  SignInService.swift
//  Bookshelf
//
//  Created by kerik on 03.04.2024.
//

import Foundation
import FirebaseAuth

// MARK: - Абрамов Кирилл
class SignInService: SignInServiceProtocol {
    private let auth = Auth.auth()

    func signIn(
        email: String,
        password: String,
        completion: @escaping (Result<User, Error>) -> Void
    ) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}
