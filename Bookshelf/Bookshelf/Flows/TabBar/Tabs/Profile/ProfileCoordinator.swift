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
        let authService = AuthService()
        let imageNetService = ImageNetworkService()
        let viewModel = ProfileViewModel(authService: authService, imageNetService: imageNetService)
        let profileController = ProfileViewController(viewModel: viewModel)

        profileController.completionHandler = { [weak self] status in
            switch status {
            case .logOut:
                self?.flowCompletionHandler?()
            }
        }
        router.setRootController(profileController)
    }
}
