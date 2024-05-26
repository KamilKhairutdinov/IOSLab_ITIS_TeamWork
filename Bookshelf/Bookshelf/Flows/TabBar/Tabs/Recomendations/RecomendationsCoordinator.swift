//
//  RecomendationsCoordinator.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

import UIKit
import SwiftUI

// MARK: - Бородач Евгения

// MARK: - Уваров Тимур

class RecomendationsCoordinator: BaseCoordinator {
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
        showRecomendationsController()
    }
}

// MARK: - Configure flow actions
extension RecomendationsCoordinator {
    private func showRecomendationsController() {
        let recomendationsController = RecomendationsViewController(viewModel: RecomendationsViewModel(networkingService: NetworkingService.shared))
        recomendationsController.completionHandler = { book in
                    self.showDetailSUIView(book: book)
                }

        router.setRootController(recomendationsController)
    }

    private func showDetailSUIView(book: BookFromApi) {
        let detailView = moduleFactory.createDetailModule(book: book)
        let detailController = UIHostingController(rootView: detailView)
        router.push(detailController, animated: true)
    }
}
