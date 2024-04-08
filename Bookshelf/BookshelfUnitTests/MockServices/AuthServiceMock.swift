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

    func signIn(email: String, password: String, completion: @escaping (Result<User, any Error>) -> Void) {
    }

    func signUp(email: String, password: String, completion: @escaping (Result<User, any Error>) -> Void) {
    }

    func logOut() {
        currentUser.isLogIn = false
    }
}
