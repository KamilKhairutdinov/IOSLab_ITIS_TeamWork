//
//  RecomendationsViewModel.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

import Foundation
import UIKit

// MARK: - Бородач Евгения
class RecomendationsViewModel {
    private var imageNetService = ImageNetworkService()

    func getImage() -> UIImageView {
        imageNetService.getImage()
    }
}
