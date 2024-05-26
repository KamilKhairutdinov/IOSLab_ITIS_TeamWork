//
//  LibraryViewModel.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 26.05.2024.
//

import Foundation
// Камил Хайрутдинов
final class LibraryViewModel: ObservableObject {

    // MARK: - Variables
    private let networkingService: NetworkingServiceProtocol

    // MARK: - Init
    init(networkingService: NetworkingServiceProtocol) {
        self.networkingService = networkingService
    }

    func fechBooks(completion: @escaping (([BookFromApi]) -> Void)) {
        networkingService.fetchBooks { [weak self] result in
            guard let self else { return }
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
