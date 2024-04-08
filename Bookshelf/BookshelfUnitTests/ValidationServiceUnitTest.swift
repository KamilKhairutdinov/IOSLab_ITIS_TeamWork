//
//  ValidationServiceUnitTest.swift
//  BookshelfUnitTests
//
//  Created by kerik on 08.04.2024.
//

import XCTest
@testable import class Bookshelf.ValidationService

final class ValidationServiceUnitTest: XCTestCase {

    func test_empty_email_and_password() {
        // GIVEN
        let validationService = ValidationService()
        let email = ""
        let password = ""

        // WHEN
        let errors = validationService.validateUser(email, password, password)

        // THEN
        XCTAssertEqual(errors, ["Почта не может быть пустой!", "Пароль не может быть пустой!"])
    }

    func test_valid_user() {
        // GIVEN
        let validationService = ValidationService()
        let email = "test@test.ru"
        let password = "test123"

        // WHEN
        let errors = validationService.validateUser(email, password, password)

        // THEN
        XCTAssertEqual(errors, [])
    }

    func test_not_equal_password_and_password_confirmation() {
        // GIVEN
        let validationService = ValidationService()
        let email = "test@test.ru"
        let password = "test123"
        let passwordConfirmation = "test12345"

        // WHEN
        let errors = validationService.validateUser(email, password, passwordConfirmation)

        // THEN
        XCTAssertEqual(errors, ["Пароли не совпадают"])
    }

}
