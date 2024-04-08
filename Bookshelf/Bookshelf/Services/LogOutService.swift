//
//  LogOutService.swift
//  Bookshelf
//
//  Created by evaklq on 2024-04-08.
//

import Foundation
import FirebaseAuth

// MARK: - Женя Бородач
class LogOutService: LogOutServiceProtocol {
    private let auth = Auth.auth()

    func logOut() {
        do {
            try auth.signOut()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
