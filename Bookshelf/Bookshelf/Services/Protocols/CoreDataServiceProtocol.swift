//
//  CoreDataServiceProtocol.swift
//  Bookshelf
//
//  Created by kerik on 26.05.2024.
//

import Foundation

// Кирилл Абрамов
protocol CoreDataServiceProtocol {
    func setUser(user: UserModel)
    func getCachedUser(by id: String) throws -> UserModel?
    func clearCachedData()
    func updateUserData(user: UserModel)
}
