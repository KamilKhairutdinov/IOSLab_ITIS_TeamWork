//
//  SignInServiceProtocol.swift
//  Bookshelf
//
//  Created by kerik on 03.04.2024.
//

import Foundation
import FirebaseAuth

// MARK: - Абрамов Кирилл
protocol SignInServiceProtocol {
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
}
