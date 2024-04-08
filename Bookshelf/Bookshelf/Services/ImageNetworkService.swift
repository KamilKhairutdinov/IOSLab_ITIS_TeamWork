//
//  ImageNetworkService.swift
//  Bookshelf
//
//  Created by evaklq on 2024-04-08.
//

import UIKit

// MARK: - Женя Бородач
class ImageNetworkService: ImageNetworkServiceProtocol {

    private var url: URL?
    init() {
        url = getURL()
    }

    /// Даёт дефолтгую картинку, можно задать свою, вызвав сначала getURL()
    func getImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "scribble.variable"))

        return imageView
    }
}
