//
//  AuthServiceMock.swift
//  BookshelfUnitTests
//
//  Created by evaklq on 2024-04-08.
//

import Foundation
import FirebaseAuth
@testable import protocol Bookshelf.AuthServiceProtocol

class AuthServiceMock: AuthServiceProtocol {

    var currentUser = UserData()

    func getCurrentUser() -> UserData {
        currentUser
    }

    func signIn(email: String, password: String, completion: @escaping (Result<User, any Error>) -> Void) {
        completion(.failure(NSError(domain: "ashibka", code: 404)))
    }

    func signUp(
        email: String,
        password: String,
        completion: @escaping (Result<User, Error>) -> Void
    ) {
        completion(.failure(NSError(domain: "ashibka", code: 404)))
    }

    func logOut() {
        currentUser.isLogIn = false
    }
}
