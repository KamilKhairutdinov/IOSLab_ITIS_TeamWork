//
//  BookFromApi.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 26.05.2024.
//

import Foundation

struct BookFromApi: Decodable, Identifiable {
    let id: Int
    let title: String
    let authors, translators: [Author]
    let subjects, bookshelves: [String]
    let languages: [String]
    let copyright: Bool
    let mediaType: String
    let formats: Formats
    let downloadCount: Int

    enum CodingKeys: String, CodingKey {
        case id, title, authors, translators, subjects, bookshelves, languages, copyright
        case mediaType = "media_type"
        case formats
        case downloadCount = "download_count"
    }
}
