//
//  CoordinatorFactory.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import UIKit

class CoordinatorFactory: CoordinatorFactoryProtocol {

    func createAppCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) -> AppCoordinator {
        AppCoordinator(router: router, coordinatorFactory: coordinatorFactory)
    }
    
    func createAuthFlowCoordinator() {

    }
    
}

