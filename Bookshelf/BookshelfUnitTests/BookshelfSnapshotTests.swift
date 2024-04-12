//
//  BookshelfSnapshotTests.swift
//  BookshelfUnitTests
//
//  Created by Камил Хайрутдинов on 08.04.2024.
//

import XCTest
import SnapshotTesting

@testable import Bookshelf

final class BookshelfSnapshotTests: XCTestCase {

    // MARK: - Хайрутдинов Камил
    func test_auth_view_controller() throws {
        let viewController = AuthViewController()
        assertSnapshot(of: viewController, as: .image)
    }

    func test_sign_in_view_controller() throws {
        let viewModel = SignInViewModel()
        let viewController = SignInViewController(viewModel: viewModel)
        assertSnapshot(of: viewController, as: .image)
    }

    // MARK: - Абрамов Кирилл
    func test_sign_up_view_controller() throws {
        let viewModel = SignUpViewModel()
        let viewController = SignUpController(viewModel: viewModel)
        assertSnapshot(of: viewController, as: .image)
    }

    func test_rec_view_controller() throws {
        let imageService = ImageNetworkServiceMock()
        let viewModel = RecomendationsViewModel(imageNetService: imageService)
        let viewController = RecomendationsViewController(viewModel: viewModel)
        assertSnapshot(of: viewController, as: .image)
    }

    // MARK: - Уваров Тимур
    func test_sign_up_viewcontroller() throws {
        let viewModel = SignUpViewModel()
        let viewController = SignUpController(viewModel: viewModel)
        assertSnapshot(of: viewController, as: .image)
    }

    func test_tab_bar_view_controller() throws {
        let viewController = TabBarViewController()
        assertSnapshot(of: viewController, as: .image)
    }

    // MARK: - Бородач Женя
    func test_library_view_controller() throws {
        let imageService = LibraryViewModel()
        let viewModel = LibraryViewModel()
        let viewController = LibraryViewController(viewModel: viewModel)
        assertSnapshot(of: viewController, as: .image)
    }

    func test_profile_view_controller() throws {
        let auth = AuthServiceMock()
        let image = ImageNetworkServiceMock()
        let viewModel = ProfileViewModel(authService: auth, imageNetService: image)
        let viewController = ProfileViewController(viewModel: viewModel)
        assertSnapshot(of: viewController, as: .image)
    }
}
