//
//  ImageNetworkServiceProtocol.swift
//  Bookshelf
//
//  Created by evaklq on 2024-04-08.
//

import UIKit

// MARK: - Женя Юородач
protocol ImageNetworkServiceProtocol {
    func getImage() -> UIImageView
    func getURL(host: String, path: String, scheme: URLScheme)
}
