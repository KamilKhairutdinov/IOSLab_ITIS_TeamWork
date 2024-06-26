//
//  LibraryCoordinator.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

import UIKit
import SwiftUI

// MARK: - Бородач Евгения
class LibraryCoordinator: BaseCoordinator {
    // MARK: - Declaration objects
    private var router: RouterProtocol
    private var coordinatorFactory: CoordinatorFactoryProtocol
    private var moduleFactory: ModuleFactoryProtocol

    // MARK: - Init
    init(router: RouterProtocol, coordinator: CoordinatorFactoryProtocol, moduleFactory: ModuleFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinator
        self.moduleFactory = moduleFactory
    }

    override func start() {
        showLibraryController()
    }
}

// MARK: - Configure flow actions
extension LibraryCoordinator {
    private func showLibraryController() {
        let libraryController = UIHostingController(rootView: moduleFactory.createLibraryModule())
        router.setRootController(libraryController)
    }
}
