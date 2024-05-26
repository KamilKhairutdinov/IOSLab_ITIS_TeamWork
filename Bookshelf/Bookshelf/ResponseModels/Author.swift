//
//  Author.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 26.05.2024.
//

import Foundation

struct Author: Decodable {
    let name: String
    let birthYear, deathYear: Int?

    enum CodingKeys: String, CodingKey {
        case name
        case birthYear = "birth_year"
        case deathYear = "death_year"
    }
}
