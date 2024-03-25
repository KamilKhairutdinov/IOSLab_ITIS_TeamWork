//
//  CoordinatorFactory.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import UIKit

class CoordinatorFactory: CoordinatorFactoryProtocol {

    // MARK: - Хайрутдинов Камил
    func createAppCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) -> AppCoordinator {
        AppCoordinator(router: router, coordinatorFactory: coordinatorFactory)
    }

    // MARK: - Хайрутдинов Камил
    func createAuthFlowCoordinator(
        router: RouterProtocol,
        coordinatorFactory: CoordinatorFactoryProtocol,
        moduleFactory: ModuleFactoryProtocol
    ) -> AuthFlowCoordinator {
        AuthFlowCoordinator(router: router, coordinatorFactory: coordinatorFactory, moduleFactory: moduleFactory)
    }

    func createSignInFlowCoordinator(
        router: RouterProtocol,
        coordinatorFactory: CoordinatorFactoryProtocol,
        moduleFactory: ModuleFactoryProtocol) -> SignInFlowCoordinator {
        SignInFlowCoordinator(router: router, coordinatorFactory: coordinatorFactory, moduleFactory: moduleFactory)
    }

    // MARK: - Бородач Евгения
    func createRecomendationsFlowCoordinator(
        router: RouterProtocol,
        coordinatorFactory: CoordinatorFactoryProtocol,
        moduleFactory: ModuleFactoryProtocol) -> RecomendationsCoordinator {
            RecomendationsCoordinator(router: router, coordinator: coordinatorFactory, moduleFactory: moduleFactory)
    }
    func createLibraryFlowCoordinator(
        router: RouterProtocol,
        coordinatorFactory: CoordinatorFactoryProtocol,
        moduleFactory: ModuleFactoryProtocol) -> LibraryCoordinator {
            LibraryCoordinator(router: router, coordinator: coordinatorFactory, moduleFactory: moduleFactory)
    }
    func createProfileFlowCoordinator(
        router: RouterProtocol,
        coordinatorFactory: CoordinatorFactoryProtocol,
        moduleFactory: ModuleFactoryProtocol) -> ProfileCoordinator {
            ProfileCoordinator(router: router, coordinator: coordinatorFactory, moduleFactory: moduleFactory)
    }
}

