//
//  SignUpServiceProtocol.swift
//  Bookshelf
//
//  Created by Rustem on 24.03.2024.
//

import Foundation
import FirebaseAuth

// MARK: - Уваров Тимур

protocol SignUpServiceProtocol {
    func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
}
