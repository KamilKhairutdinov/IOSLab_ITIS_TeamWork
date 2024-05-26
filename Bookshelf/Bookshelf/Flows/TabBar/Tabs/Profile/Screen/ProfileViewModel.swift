//
//  ProfileViewModel.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

import Foundation
import UIKit

// MARK: - Бородач Евгения
class ProfileViewModel {
    // MARK: - Declaration objects
    private var authService: any AuthServiceProtocol
    private var coreDataService: CoreDataServiceProtocol
    @Published var userModel: UserModel

    init(
        authService: any AuthServiceProtocol,
        coreDataService: CoreDataServiceProtocol
    ) {
        self.authService = authService
        self.coreDataService = coreDataService
        userModel = UserModel(id: "", name: "", email: "", avatarData: nil)
    }

    // Кирилл Абрамов
    func getUserData() {
        guard let user = authService.currentUser else { return }
        guard let email = user.email else { return }
        userModel = UserModel(id: user.uid, email: email)

        do {
            if let user = try coreDataService.getCachedUser(by: user.uid) {
                self.userModel.email = user.email
                self.userModel.name = user.name
                self.userModel.id = user.id
                self.userModel.avatarData = user.avatarData
            } else {
                self.coreDataService.setUser(user: self.userModel)
            }
        } catch {
            print(error)
        }
    }

    func logOut() {
        authService.logOut()
    }

    // Кирилл Абрамов
    func setUserData(image: Data?, name: String) {
        self.userModel = UserModel(id: userModel.id, name: name, email: userModel.email, avatarData: image)
        coreDataService.updateUserData(user: self.userModel)
    }
}
