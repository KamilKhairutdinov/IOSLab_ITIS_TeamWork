//
//  UserModel.swift
//  Bookshelf
//
//  Created by kerik on 26.05.2024.
//

import Foundation

struct UserModel {
    var id: String
    var name: String?
    var email: String
    var avatarData: Data?

    init(id: String, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }

    init(id: String, email: String) {
        self.id = id
        self.email = email
    }

    init(id: String, name: String, email: String, avatarData: Data?) {
        self.id = id
        self.name = name
        self.email = email
        self.avatarData = avatarData
    }
}
