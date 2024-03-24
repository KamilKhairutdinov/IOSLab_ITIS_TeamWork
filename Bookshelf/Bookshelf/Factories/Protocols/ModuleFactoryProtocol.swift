//
//  ModuleFactoryProtocol.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 23.03.2024.
//

import Foundation

protocol ModuleFactoryProtocol {
    // MARK: - Хайрутдинов Камил
    func createAuthModule() -> AuthViewController
    // MARK: - Уваров Тимур
    func createSignUpModule(viewModel: SignUpViewModel) -> SignUpController
}
