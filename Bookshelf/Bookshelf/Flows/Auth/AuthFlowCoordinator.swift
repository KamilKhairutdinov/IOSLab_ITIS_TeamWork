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
    private var moduleFactory: ModuleFactoryProtocol

    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, moduleFactory: ModuleFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.moduleFactory = moduleFactory
    }

    override func start() {
        showAuthScreen()
    }

    private func showAuthScreen() {
        let authController = moduleFactory.createAuthModule()
        authController.completionHandler = { [weak self] state in
            guard let self else { return }
            switch state {
            case .signIn:
                self.runSignInFlow()
            case .singUp:
                self.runSignUpFlow()
            }
        }
        router.push(authController, animated: true)
    }

    private func runSignInFlow() {
        // TODO: Кирилл
        print("тестовый кирил")
    }

    // MARK: Тимур Уваров
    private func runSignUpFlow() {
        let signUpFlowCoordinator = coordinatorFactory.createSignUpFlowCoordinator(router: router, coordinatorFactory: coordinatorFactory, moduleFactory: moduleFactory)
            signUpFlowCoordinator.start()
            addDependency(signUpFlowCoordinator)
            signUpFlowCoordinator.flowCompletionHandler = { [weak self] in
                guard let self else { return }
                self.router.popToRootController(animated: false)
                self.runSignInFlow()
                self.removeDependency(signUpFlowCoordinator)
            }
    }
}
