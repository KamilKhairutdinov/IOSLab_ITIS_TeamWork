//
//  URLBuilder.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

// MARK: - Бородач Евгения
import UIKit

enum URLBuilderError: Error {
    case emptyHost
    case emptyScheme
    case inconsistentCredentials
    case systemError
}

enum URLScheme: String {
    case https, http
}

final class URLBuilder {
    // MARK: - Declaration objects
    private var scheme: URLScheme?
    private var host: String?
    private var port: Int?
    private var path = ""
    private var queryItems: [String: String]?

    // MARK: - Check data of url
    func with(scheme: URLScheme) -> URLBuilder {
        self.scheme = scheme
        return self
    }
    func with(host: String) -> URLBuilder {
        self.host = host
        return self
    }
    func with(port: Int) -> URLBuilder {
        self.port = port
        return self
    }
    func with(path: String) -> URLBuilder {
        self.path = path
        return self
    }
    func with(queryItems: [String: String]) -> URLBuilder {
        self.queryItems = queryItems
        return self
    }
}

// MARK: - Build url
extension URLBuilder {
    func build() -> URL {
        let baseURL = URL(fileURLWithPath: "")

        guard let host = host else {
            print("\(URLBuilderError.emptyHost)")
            return baseURL
        }

        guard let scheme = scheme else {
            print("\(URLBuilderError.emptyScheme)")
            return baseURL
        }

        var urlComponents = URLComponents()
        urlComponents.scheme = scheme.rawValue
        urlComponents.host = host
        urlComponents.port = port
        urlComponents.path = path
        urlComponents.queryItems = queryItems?.map {
            URLQueryItem(name: $0, value: $1)
        }

        guard let url = urlComponents.url else {
            print("\(URLBuilderError.inconsistentCredentials)")
            return URL(fileURLWithPath: "")
        }

        return url
    }
}
