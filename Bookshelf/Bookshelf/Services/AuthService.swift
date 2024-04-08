//
//  AuthService.swift
//  Bookshelf
//
//  Created by kerik on 08.04.2024.
//

import Foundation
import FirebaseAuth

final class AuthService: AuthServiceProtocol {
    var currentUser: User? {
        return auth.currentUser
    }

    static let shared = AuthService()
    private let auth: Auth

    init() {
        auth = Auth.auth()
    }

    // MARK: - Уваров Тимур
    func signUp(
        email: String,
        password: String,
        completion: @escaping (Result<User, Error>) -> Void
    ) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error {
                completion(.failure(error))
            }
        }
    }

    // MARK: - Абрамов Кирилл
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

    // MARK: - Бородач Женя
    func logOut() {
        do {
            try auth.signOut()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
