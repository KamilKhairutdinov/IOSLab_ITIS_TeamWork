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

    // MARK: - Абрамов Кирилл
    func createSignInModule(viewModel: SignInViewModel) -> SignInViewController

    // MARK: - Бородач Евгения
    func createRecomendationsModule(viewModel: RecomendationsViewModel) -> RecomendationsViewController
    func createLibraryModule(viewModel: LibraryViewModel) -> LibraryViewController
    func createProfileModule(viewModel: ProfileViewModel) -> ProfileViewController
}
