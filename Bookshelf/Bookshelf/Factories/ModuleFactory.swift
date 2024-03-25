//
//  ModuleFactory.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 23.03.2024.
//

import Foundation

class ModuleFactory: ModuleFactoryProtocol {

    // MARK: - Хайрутдинов Камил
    func createAuthModule() -> AuthViewController {
        AuthViewController()
    }

    // MARK: - Абрамов Кирилл
    func createSignInModule(viewModel: SignInViewModel) -> SignInViewController {
        SignInViewController(viewModel: viewModel)
    }

    // MARK: - Бородач Евгения
    func createRecomendationsModule(viewModel: RecomendationsViewModel) -> RecomendationsViewController {
        RecomendationsViewController(viewModel: viewModel)
    }
    func createLibraryModule(viewModel: LibraryViewModel) -> LibraryViewController {
        LibraryViewController(viewModel: viewModel)
    }
    func createProfileModule(viewModel: ProfileViewModel) -> ProfileViewController {
        ProfileViewController(viewModel: viewModel)
    }
}
