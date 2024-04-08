//
//  BookshelfUITests.swift
//  BookshelfUITests
//
//  Created by Камил Хайрутдинов on 07.04.2024.
//

import XCTest

final class BookshelfUITests: XCTestCase {

    // MARK: - SignInView: Абрамов Кирилл
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

    // MARK: - AuthView: Камил Хайрутдинов
    func test_AuthView_signInButton() {
        XCTAssert(app.buttons["signInButton"].exists)
    }

    func test_AuthView_signUpButton() {
        XCTAssert(app.buttons["signUpButton"].exists)
    }

    // MARK: - RecomendationsView: Бородач Женя
    func test_recomendations_view_exist_image() throws {
        app.buttons["signInButton"].tap()

        app.textFields["emailTextField"].tap()
        app.textFields["emailTextField"].typeText("Evaklqq@mail.ru")

        app.secureTextFields["passwordTextField"].tap()
        app.secureTextFields["passwordTextField"].typeText("evaklqq")

        sleep(2)

        app.buttons["done"].tap()
        app.buttons["signIn"].tap()

        sleep(2)

        XCTAssert(app.images["recomendedBookImage"].exists)
    }

    // MARK: - ProfileView: Бородач Женя
    func test_profile_view_exist_image() throws {
        app.buttons["signInButton"].tap()

        app.textFields["emailTextField"].tap()
        app.textFields["emailTextField"].typeText("Evaklqq@mail.ru")

        app.secureTextFields["passwordTextField"].tap()
        app.secureTextFields["passwordTextField"].typeText("evaklqq")

        sleep(2)

        app.buttons["done"].tap()
        app.buttons["signIn"].tap()

        sleep(2)

        XCUIApplication().tabBars["Tab Bar"].buttons["person"].tap()
        XCTAssert(app.images["userIconImage"].exists)
    }
}
