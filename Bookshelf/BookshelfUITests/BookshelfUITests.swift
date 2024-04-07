//
//  BookshelfUITests.swift
//  BookshelfUITests
//
//  Created by Камил Хайрутдинов on 07.04.2024.
//

import XCTest

final class BookshelfUITests: XCTestCase {

    // MARK: - Камил Хайрутдинов
    func test_AuthView_signInButton() {
        let app = XCUIApplication()
        app.launch()

        XCTAssert(app.buttons["signInButton"].exists)
    }

    // MARK: - Камил Хайрутдинов
    func test_AuthView_signUpButton() {
        let app = XCUIApplication()
        app.launch()

        XCTAssert(app.buttons["signUpButton"].exists)
    }
}
