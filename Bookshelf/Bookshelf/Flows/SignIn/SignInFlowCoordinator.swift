//
//  SignInFlowCoordinator.swift
//  Bookshelf
//
//  Created by kerik on 24.03.2024.
//

import UIKit

// MARK: - Абрамов Кирилл
class SignInFlowCoordinator: BaseCoordinator {
    private var router: RouterProtocol
    private var coordinatorFactory: CoordinatorFactoryProtocol
    private var moduleFactory: ModuleFactoryProtocol

    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, moduleFactory: ModuleFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.moduleFactory = moduleFactory
    }

    override func start() {
        showSignInViewController()
    }

    private func showSignInViewController() {
        let signInViewController = SignInViewController(viewModel: SignInViewModel())
        signInViewController.completionHandler = { [weak self] in
            guard let self else { return }
            self.flowCompletionHandler?()
        }
        router.push(signInViewController, animated: true)
    }
}
