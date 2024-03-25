//
//  SignUpFlowCoordinator.swift
//  Bookshelf
//
//  Created by Rustem on 24.03.2024.
//

import UIKit

// MARK: - Уваров Тимур
class SignUpFlowCoordinator: BaseCoordinator {
    private var router: RouterProtocol
    private var coordinatorFactory: CoordinatorFactoryProtocol
    private var moduleFactory: ModuleFactoryProtocol

    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, moduleFactory: ModuleFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.moduleFactory = moduleFactory
    }

    override func start() {
        showSignUpController()
    }

    private func showSignUpController() {
        let signUpViewController = moduleFactory.createSignUpModule(viewModel: SignUpViewModel())
        signUpViewController.completionHandler = { [weak self] in
            guard let self else { return }
            self.flowCompletionHandler?()
        }
        router.push(signUpViewController, animated: true)
    }

}
