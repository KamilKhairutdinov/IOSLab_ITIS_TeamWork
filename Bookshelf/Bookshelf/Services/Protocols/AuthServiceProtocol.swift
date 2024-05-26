//
//  AuthServiceProtocol.swift
//  Bookshelf
//
//  Created by kerik on 08.04.2024.
//

import Foundation
import FirebaseAuth

protocol AuthServiceProtocol {
    var currentUser: User? {get}
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func logOut()
}
