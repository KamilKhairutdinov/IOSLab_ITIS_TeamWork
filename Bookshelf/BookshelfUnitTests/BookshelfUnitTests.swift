//
//  BookshelfUnitTests.swift
//  BookshelfUnitTests
//
//  Created by Камил Хайрутдинов on 07.04.2024.
//

import XCTest
@testable import class Bookshelf.Router
@testable import class Bookshelf.ValidationService
@testable import class Bookshelf.AuthService
@testable import class Bookshelf.RecomendationsViewModel
@testable import class Bookshelf.ProfileViewModel
@testable import protocol Bookshelf.ImageNetworkServiceProtocol
@testable import protocol Bookshelf.AuthServiceProtocol

// MARK: - Coordinator and router: Камил Хыйрутдинов
final class BookshelfUnitTests: XCTestCase {
    func test_coordinator_has_child() {
        // GIVEN
        let mockAppCoordinator = MockAppCoordinator(router: Router(rootController: UINavigationController()))
        mockAppCoordinator.start()

        // WHEN
        mockAppCoordinator.mockWithValueViewController?.completionHandler?(.push)

        // THEN
        XCTAssertFalse(mockAppCoordinator.childCoordinators.isEmpty, "test_coordinator_has_child error")
    }

    func test_coordinator_has_no_childs() {
        // GIVEN
        let mockAppCoordinator = MockAppCoordinator(router: Router(rootController: UINavigationController()))
        mockAppCoordinator.start()

        // WHEN
        mockAppCoordinator.mockWithValueViewController?.completionHandler?(.push)
        mockAppCoordinator.additionalFlowCoordinator?.mockEmptyViewController?.completionHandler?()

        // THEN
        XCTAssertTrue(mockAppCoordinator.childCoordinators.isEmpty, "test_coordinator_has_no_child error")
    }

    func test_router() {
        // GIVEN
        let mockAppCoordinator = MockAppCoordinator(router: Router(rootController: UINavigationController()))
        mockAppCoordinator.start()

        // WHEN
        mockAppCoordinator.mockWithValueViewController?.completionHandler?(.push)
        guard let presenter = mockAppCoordinator.additionalFlowCoordinator?.router.presenter() else { return }

        // THEN
        XCTAssertFalse(presenter.viewControllers.isEmpty)
    }
}

// MARK: - Validation Service: Абрамов Кирилл
extension BookshelfUnitTests {
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

// MARK: - AuthService: Уваров Тимур
extension BookshelfUnitTests {
    func test_current_user_not_nil() {
        // GIVEN
        let authService = AuthServiceMock()

        // WHEN
        let user = authService.getCurrentUser()

        // THEN
        XCTAssertNotNil(user)
    }
    func test_error_signup_with_email_and_password() {
        // GIVEN
        let authService = AuthServiceMock()
        let email = "test@test.ru"
        let password = "test123"

        var errors = ""

        // WHEN

        authService.signUp(email: email, password: password) { result in
            switch result {
            case .success:
                errors = ""
            case .failure(let error):
                errors = error.localizedDescription
            }
        }

        // THEN
        XCTAssertNotEqual(errors, "")
    }

    func test_error_login_with_email_and_password() {
        // GIVEN
        let authService = AuthServiceMock()
        let email = "test@test.ru"
        let password = "test123"

        var errors = ""

        // WHEN
        authService.signIn(email: email, password: password) { result in
            switch result {
            case .success:
                errors = ""
            case .failure(let error):
                errors = error.localizedDescription
            }
        }

        // THEN
        XCTAssertNotEqual(errors, "")
        }
    }

// MARK: - Image Network Service: Бородач Женя
extension BookshelfUnitTests {
    func test_recomendations_view_model_image_not_nil() {
        // GIVEN
        let imageNetServiceMock = ImageNetworkServiceMock()
        let recomendationVM = RecomendationsViewModel(imageNetService: imageNetServiceMock)

        // WHEN
        let imageView = recomendationVM.getImage()

        // THEN
        XCTAssertNotNil(imageView)
    }

    func test_recomendations_view_model_default_image_url_correct() {
        // GIVEN
        let imageNetServiceMock = ImageNetworkServiceMock()
        let recomendationVM = RecomendationsViewModel(imageNetService: imageNetServiceMock)
        let defaultURL = "https://avatars.mds.yandex.net/get-mpic/5332815/img_id5910357100315851824.jpeg/600x800"

        // WHEN
        let url = recomendationVM.setImageLink()

        // THEN
        XCTAssertEqual(url.absoluteString, defaultURL)
    }

    func test_profile_view_model_log_out_correct() {
        // GIVEN
        let imageNetServiceMock = ImageNetworkServiceMock()
        let authServiceMock = AuthServiceMock()
        let profileVM = ProfileViewModel(authService: authServiceMock, imageNetService: imageNetServiceMock)

        // WHEN
        profileVM.logOut()

        // THEN
        XCTAssertFalse(authServiceMock.currentUser.isLogIn)
    }
}
