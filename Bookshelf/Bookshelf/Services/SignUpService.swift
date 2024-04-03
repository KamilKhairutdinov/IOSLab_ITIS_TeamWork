//
//  SignUpService.swift
//  Bookshelf
//
//  Created by Rustem on 24.03.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// MARK: - Уваров Тимур

class SignUpService: SignUpServiceProtocol {

    var currentUser: User? {
        return auth.currentUser
    }
    private let auth: Auth

    init() {
        auth = Auth.auth()
    }

    func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error {
                completion(.failure(error))
            }
        }
    }

}
