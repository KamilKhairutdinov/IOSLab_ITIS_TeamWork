//
//  BookApiModel.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 26.05.2024.
//

import Foundation

struct BookApiModel: Decodable {
    let count: Int
    let next: String
    let previous: String?
    let results: [BookFromApi]
}

