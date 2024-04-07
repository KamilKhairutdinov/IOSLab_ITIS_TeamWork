//
//  SnapShopTestsBookShelf.swift
//  BookshelfUITests
//
//  Created by Камил Хайрутдинов on 07.04.2024.
//

import XCTest
import SnapshotTesting
@testable import class Bookshelf.AuthViewController

final class SnapshotTestsBookShelf: XCTestCase {

    // MARK: - Камил Хайрутдинов
    func test_AuthViewController() {
        let authViewController = AuthViewController()

        assertSnapshot(of: authViewController, as: .image)
    }
}
