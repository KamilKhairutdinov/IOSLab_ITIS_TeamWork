//
//  AuthFlowCoordinator.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import UIKit

class AuthFlowCoordinator: BaseCoordinator {
    private var router: RouterProtocol
    private var coordinatorFactory: CoordinatorFactoryProtocol

    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }

    override func start() {
        print("asdasd")
        showAuthScreen()
    }

    private func showAuthScreen() {
        router.push(ViewController(), animated: true)
    }
}
