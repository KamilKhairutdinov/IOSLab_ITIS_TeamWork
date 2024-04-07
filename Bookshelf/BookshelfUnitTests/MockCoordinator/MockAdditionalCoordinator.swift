//
//  MockAdditionalCoordinator.swift
//  BookshelfUnitTests
//
//  Created by Камил Хайрутдинов on 07.04.2024.
//

import UIKit
@testable import class Bookshelf.BaseCoordinator
@testable import class Bookshelf.Router

// MARK: - Камил Хыйрутдинов
final class MockAdditionalCoordinator: BaseCoordinator {

    // MARK: - Variables
    var router: Router
    var mockEmptyViewController: MockEmptyViewController?

    // MARK: - Init
    init(router: Router) {
        self.router = router
    }

    // MARK: - Functions
    override func start() {
        showMockEmptyViewController()
    }

    private func showMockEmptyViewController() {
        mockEmptyViewController = MockEmptyViewController()
        guard let mockEmptyViewController else { return }

        mockEmptyViewController.completionHandler = { [weak self] in
            guard let self else { return }
            router.pop(animated: false)
            self.flowCompletionHandler?()
        }
        router.push(mockEmptyViewController, animated: false)
    }
}
