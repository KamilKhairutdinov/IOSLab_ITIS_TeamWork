//
//  ImageNetworkService.swift
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

// MARK: - Женя Бородач
class ImageNetworkService: ImageNetworkServiceProtocol {

    private var url: URL?
    init() {
        getURL()
    }

    /// Даёт дефолтгую картинку, можно задать свою, вызвав сначала getURL()
    func getImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "scribble.variable"))

        return imageView
    }

    /// Создаёт ссылку на дефолтную картинку, можно задать свои данные и после вызвать getImage()
    func getURL(
        host: String = Host.avatar,
        path: String = Path.avatar,
        scheme: URLScheme = .https
    ) {
        url = URLBuilder()
            .with(host: host)
            .with(path: path)
            .with(scheme: scheme)
            .build()
    }
}
