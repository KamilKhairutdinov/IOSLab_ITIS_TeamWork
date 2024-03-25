//
//  CoordinatorFactoryProtocol.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    // MARK: - Хайрутдинов Камил
    func createAppCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) -> AppCoordinator

    // MARK: - Хайрутдинов Камил
    func createAuthFlowCoordinator(
        router: RouterProtocol,
        coordinatorFactory: CoordinatorFactoryProtocol,
        moduleFactory: ModuleFactoryProtocol
    ) -> AuthFlowCoordinator
    // MARK: - Уваров Тимур
    func createSignUpFlowCoordinator(
        router: RouterProtocol,
        coordinatorFactory: CoordinatorFactoryProtocol,
        moduleFactory: ModuleFactoryProtocol
    ) -> SignUpFlowCoordinator

    // MARK: - Абрамов Кирилл
    func createSignInFlowCoordinator(
        router: RouterProtocol,
        coordinatorFactory: CoordinatorFactoryProtocol,
        moduleFactory: ModuleFactoryProtocol
    ) -> SignInFlowCoordinator

}
