//
//  CoordinatorFactoryProtocol.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    func createAppCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) -> AppCoordinator
    func createAuthFlowCoordinator()
}
