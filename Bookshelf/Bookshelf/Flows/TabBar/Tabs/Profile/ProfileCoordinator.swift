//
//  ProfileCoordinator.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

import UIKit

// MARK: - Бородач Евгения
class ProfileCoordinator: BaseCoordinator {
    // MARK: - Declaration objects
    private var router: RouterProtocol
    private var coordinatorFactory: CoordinatorFactoryProtocol
    private var moduleFactory: ModuleFactoryProtocol

    // MARK: - Init
    init(router: RouterProtocol, coordinator: CoordinatorFactoryProtocol, moduleFactory: ModuleFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinator
        self.moduleFactory = moduleFactory
    }

    override func start() {
        showProfileController()
    }
}

// MARK: - Configure flow actions
extension ProfileCoordinator {
    private func showProfileController() {
        let profileController = ProfileViewController(viewModel: ProfileViewModel())
        router.setRootController(profileController)
    }
}
