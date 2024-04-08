//
//  BookshelfSnapshotTests.swift
//  BookshelfUnitTests
//
//  Created by Камил Хайрутдинов on 08.04.2024.
//

import XCTest
import SnapshotTesting

@testable import Bookshelf

final class BookshelfSnapshotTests: XCTestCase {

    func testExample() throws {
        let viewController = AuthViewController()
        assertSnapshot(of: viewController, as: .image)
    }
}
