//
//  APITarget.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 26.05.2024.
//

import Foundation
import Moya

enum APITarget: TargetType {
    case getBooks
    case getBook(bookId: Int)
}

extension APITarget {
    var baseURL: URL {
        guard let url = URL(string: "https://gutendex.com")
        else {
            fatalError("APITarget url error")
        }
        return url
    }

    var path: String {
        switch self {
        case .getBooks:
            return "/books"
        case .getBook(let bookId):
            return "/books?ids=\(bookId)"
        }
    }

    var method: Moya.Method {
        .get
    }

    var task: Moya.Task {
        .requestPlain
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
