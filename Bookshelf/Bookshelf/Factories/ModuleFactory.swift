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

    // MARK: - Абрамов Кирилл
    func createSignInModule(viewModel: SignInViewModel) -> SignInViewController {
        SignInViewController(viewModel: viewModel)
    }

    // MARK: - Бородач Евгения
    func createRecomendationsModule(viewModel: RecomendationsViewModel) -> RecomendationsViewController {
        RecomendationsViewController(viewModel: viewModel)
    }
    func createLibraryModule() -> LibrarySUIView {
        LibrarySUIView(viewModel: LibraryViewModel(networkingService: NetworkingService.shared))
    }
    func createDetailModule(book: BookFromApi) -> DetailSUIView {
        DetailSUIView(book: book)
    }
    func createProfileModule(viewModel: ProfileViewModel) -> ProfileViewController {
        ProfileViewController(viewModel: viewModel)
    }
}
