//
//  RecomendationsCoordinator.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

import UIKit

// MARK: - Бородач Евгения
class RecomendationsCoordinator: BaseCoordinator {
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
        showRecomendationsController()
    }
}

// MARK: - Configure flow actions
extension RecomendationsCoordinator {
    private func showRecomendationsController() {
        let recomendationsController = RecomendationsViewController(viewModel: RecomendationsViewModel())
        router.setRootController(recomendationsController)
    }
}
