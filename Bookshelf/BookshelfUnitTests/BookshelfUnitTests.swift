//
//  BookshelfUnitTests.swift
//  BookshelfUnitTests
//
//  Created by Камил Хайрутдинов on 07.04.2024.
//

import XCTest
@testable import class Bookshelf.Router

final class BookshelfUnitTests: XCTestCase {

    // MARK: - Камил Хыйрутдинов
    func test_coordinator_has_child() {
        // GIVEN
        let mockAppCoordinator = MockAppCoordinator(router: Router(rootController: UINavigationController()))
        mockAppCoordinator.start()

        // WHEN
        mockAppCoordinator.mockWithValueViewController?.completionHandler?(.push)

        // THEN
        XCTAssertFalse(mockAppCoordinator.childCoordinators.isEmpty, "test_coordinator_has_child error")
    }

    // MARK: - Камил Хыйрутдинов
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

    // MARK: - Камил Хыйрутдинов
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
