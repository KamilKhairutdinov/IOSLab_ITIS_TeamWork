//
//  AuthFlowCoordinator.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import UIKit

// MARK: - Хайрутдинов Камил
class AuthFlowCoordinator: BaseCoordinator {
    private var router: RouterProtocol
    private var coordinatorFactory: CoordinatorFactoryProtocol

    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }

    override func start() {
        showAuthScreen()
    }

    private func showAuthScreen() {
        // ToDo router.push(, animated: true)
    }
}
