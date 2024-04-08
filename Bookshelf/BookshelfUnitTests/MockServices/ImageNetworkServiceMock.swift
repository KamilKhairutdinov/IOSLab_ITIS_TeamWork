//
//  ImageNetworkServiceMock.swift
//  BookshelfUnitTests
//
//  Created by evaklq on 2024-04-08.
//

import UIKit
@testable import protocol Bookshelf.ImageNetworkServiceProtocol
@testable import enum Bookshelf.URLScheme
@testable import enum Bookshelf.Host
@testable import enum Bookshelf.Path
@testable import class Bookshelf.URLBuilder

final class ImageNetworkServiceMock: ImageNetworkServiceProtocol {
    func getImage() -> UIImageView {
        return UIImageView(image: UIImage(systemName: "pencil.slash"))
    }
}
