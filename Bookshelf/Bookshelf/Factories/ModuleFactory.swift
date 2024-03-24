//
//  ModuleFactory.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 23.03.2024.
//

import Foundation

class ModuleFactory: ModuleFactoryProtocol {
    // MARK: - Уваров Тимур
    func createSignUpModule(viewModel: SignUpViewModel) -> SignUpController {
        return SignUpController(viewModel: viewModel)
    }

    // MARK: - Хайрутдинов Камил
    func createAuthModule() -> AuthViewController {
        AuthViewController()
    }
}
