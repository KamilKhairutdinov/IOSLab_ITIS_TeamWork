//
//  SignInUITests.swift
//  BookshelfUITests
//
//  Created by kerik on 08.04.2024.
//

import XCTest

// MARK: - Абрамов Кирилл
final class SignInUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app.launch()
    }

    func testSignInScreenExistsElements() throws {
        app.buttons["signInButton"].tap()

        XCTAssertTrue(app.textFields["emailTextField"].exists)
        XCTAssertTrue(app.secureTextFields["passwordTextField"].exists)
        XCTAssertTrue(app.buttons["signIn"].exists)
    }

    func testSignInScreenErrorLabelExists() throws {
        app.buttons["signInButton"].tap()

        app.textFields["emailTextField"].tap()
        app.textFields["emailTextField"].typeText("")

        app.secureTextFields["passwordTextField"].tap()
        app.secureTextFields["passwordTextField"].typeText("")

        app.buttons["signIn"].tap()

        XCTAssertTrue(app.staticTexts["errorsLabel"].exists)
    }
}
