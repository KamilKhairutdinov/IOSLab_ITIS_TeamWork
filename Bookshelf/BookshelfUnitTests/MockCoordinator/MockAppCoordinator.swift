//
//  MockAppCoordinator.swift
//  BookshelfUnitTests
//
//  Created by Камил Хайрутдинов on 07.04.2024.
//

import Foundation
@testable import class Bookshelf.BaseCoordinator
@testable import class Bookshelf.Router

// MARK: - Камил Хыйрутдинов
final class MockAppCoordinator: BaseCoordinator {

    // MARK: - Variable
    var router: Router
    var mockWithValueViewController: MockWithValueVIewController?
    var additionalFlowCoordinator: MockAdditionalCoordinator?

    // MARK: - Init
    init(router: Router) {
        self.router = router
    }

    // MARK: - Ficntions
    override func start() {
        showMockWithValueVIewController()
    }

    private func showMockWithValueVIewController() {
        mockWithValueViewController = MockWithValueVIewController()
        guard let mockWithValueViewController else { return }

        mockWithValueViewController.completionHandler = { [weak self] states in
            guard let self else { return }
            switch states {
            case .push:
                self.runAdditionalFlow()
            case .exit:
                break
            }
        }
    }

    private func runAdditionalFlow() {
        additionalFlowCoordinator = MockAdditionalCoordinator(router: router)
        guard let additionalFlowCoordinator else { return }

        additionalFlowCoordinator.flowCompletionHandler = { [weak self] in
            guard let self else { return }
            self.removeDependency(additionalFlowCoordinator)
        }
        addDependency(additionalFlowCoordinator)
        additionalFlowCoordinator.start()
    }
}
