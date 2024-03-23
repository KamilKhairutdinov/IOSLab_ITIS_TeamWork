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
    func createAuthFlowCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) -> AuthFlowCoordinator {
        AuthFlowCoordinator(router: router, coordinatorFactory: coordinatorFactory)
    }
}

