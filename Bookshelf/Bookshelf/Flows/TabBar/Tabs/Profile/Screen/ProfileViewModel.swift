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
    private var imageNetService: ImageNetworkServiceProtocol

    init(authService: any AuthServiceProtocol, imageNetService: ImageNetworkServiceProtocol) {
        self.authService = authService
        self.imageNetService = imageNetService
    }

    func logOut() {
        authService.logOut()
    }
    func getImage() -> UIImageView {
        imageNetService.getImage()
    }
}
