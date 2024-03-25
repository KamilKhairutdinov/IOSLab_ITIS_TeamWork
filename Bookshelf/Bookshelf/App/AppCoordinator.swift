//
//  AppCoordinator.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import UIKit

class AppCoordinator: BaseCoordinator {

    private var router: RouterProtocol
    private var coordinatorFactory: CoordinatorFactoryProtocol
    private var isLoggedIn = false // Mock

    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }

    override func start() {
        runAuthFlow()
    }

    private func runAuthFlow() {
        let authFlowCoordinator = AuthFlowCoordinator(router: router, coordinatorFactory: coordinatorFactory, moduleFactory: ModuleFactory())
        addDependency(authFlowCoordinator)
        authFlowCoordinator.start()
        authFlowCoordinator.flowCompletionHandler = { [weak self] in
            guard let self else { return }
            self.isLoggedIn = true
            self.runMainFlow()
            self.removeDependency(authFlowCoordinator)
        }
    }

    // MARK: - Бородач Евгения
    private func runMainFlow() {
        let tabBarVC = TabBarViewController()
        let moduleFac = ModuleFactory()
        let tabBarCoordinator = TabBarCoordinator(router: router, coordinator: coordinatorFactory, moduleFactory: moduleFac, controller: tabBarVC)
        addDependency(tabBarCoordinator)
        tabBarCoordinator.flowCompletionHandler = { [weak self] in
            guard let self else { return }
            self.removeDependency(tabBarCoordinator)
        }
        router.setRootController(tabBarVC, isNavigationBarHidden: true)
        tabBarCoordinator.start()
    }
}
