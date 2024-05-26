//
//  NetworkingService.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 26.05.2024.
//

import Foundation
import Moya

// Камил Хайрутдинов
final class NetworkingService: NetworkingServiceProtocol {

    // MARK: - Variables
    private var provider: MoyaProvider<APITarget>
    private var jsonDecoder: JSONDecoder

    // MARK: - Singleton
    static let shared = NetworkingService()
    private init() {
        provider = MoyaProvider<APITarget>()
        jsonDecoder = JSONDecoder()
    }

    // MARK: - Functions
    func fetchBooks(completion: @escaping (Result<BookApiModel, any Error>) -> Void) {
        request(target: .getBooks, completion: completion)
    }

    func fetchBookById(bookId: Int, completion: @escaping (Result<BookFromApi, any Error>) -> Void) {
        request(target: .getBook(bookId: bookId), completion: completion)
    }
}

private extension NetworkingService {
    func request<T: Decodable>(target: APITarget, completion: @escaping (Result<T, Error>) -> Void) {
        provider.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    print("Data decode error")
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
