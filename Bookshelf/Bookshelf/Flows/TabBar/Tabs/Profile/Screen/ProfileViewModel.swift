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
    private var logOutService = LogOutService()
    private var imageNetService = ImageNetworkService()

    func logOut() {
        logOutService.logOut()
    }
    func getImage() -> UIImageView {
        imageNetService.getImage()
    }
}
