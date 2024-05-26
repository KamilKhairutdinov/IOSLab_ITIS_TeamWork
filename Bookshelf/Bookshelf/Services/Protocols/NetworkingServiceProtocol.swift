//
//  NetworkingServiceProtocol.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 26.05.2024.
//

import Foundation

protocol NetworkingServiceProtocol {
    func fetchBooks(completion: @escaping (Result<BookApiModel, Error>) -> Void)
    func fetchBookById(bookId: Int, completion: @escaping (Result<BookFromApi, Error>) -> Void)
}
