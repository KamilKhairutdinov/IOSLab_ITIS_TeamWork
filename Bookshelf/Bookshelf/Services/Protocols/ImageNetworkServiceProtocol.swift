//
//  ImageNetworkServiceProtocol.swift
//  Bookshelf
//
//  Created by evaklq on 2024-04-08.
//

import UIKit

enum Host {
    static let avatar = "avatars.mds.yandex.net"
}

enum Path {
    static let avatar = "/get-mpic/5332815/img_id5910357100315851824.jpeg/600x800"
}

// MARK: - Женя Юородач
protocol ImageNetworkServiceProtocol {
    func getImage() -> UIImageView
    func getURL(host: String, path: String, scheme: URLScheme) -> URL
}

extension ImageNetworkServiceProtocol {
    func getURL(host: String = Host.avatar, path: String = Path.avatar, scheme: URLScheme = .https) -> URL {

        let url = URLBuilder()
            .with(host: host)
            .with(path: path)
            .with(scheme: scheme)
            .build()

        print(url.absoluteString)
        return url
    }
}
