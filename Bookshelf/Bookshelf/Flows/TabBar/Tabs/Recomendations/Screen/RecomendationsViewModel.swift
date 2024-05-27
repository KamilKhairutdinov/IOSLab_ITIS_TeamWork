//
//  RecomendationsViewModel.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

import Foundation
import UIKit
import SwiftUI

// MARK: - Уваров Тимур
class RecomendationsViewModel: ObservableObject {
    private var imageNetService: ImageNetworkServiceProtocol
    private let networkingService: NetworkingServiceProtocol

    init(networkingService: NetworkingServiceProtocol, imageNetService: ImageNetworkServiceProtocol) {
        self.networkingService = networkingService
        self.imageNetService = imageNetService
    }

    func getImage() -> UIImageView {
        imageNetService.getImage()
    }

    func fechBooks(completion: @escaping (([BookFromApi]) -> Void)) {
        networkingService.fetchBooks { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let bookApiModel):
                completion(bookApiModel.results)
            case .failure(let error):
                print(error.localizedDescription)
                completion([])
            }
        }
    }
}
