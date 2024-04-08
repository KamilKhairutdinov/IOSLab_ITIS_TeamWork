//
//  TabBarCoordinator.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

import UIKit

// MARK: - Бородач Евгения
class TabBarCoordinator: BaseCoordinator {
    // MARK: - Declaration objects
    private var tabBarDelegateProtocol: TabBarDelegateProtocol
    private var coordinatorFactory: CoordinatorFactoryProtocol
    private var router: RouterProtocol
    private var moduleFactory: ModuleFactoryProtocol

    // MARK: - Init
    init(router: RouterProtocol, coordinator: CoordinatorFactoryProtocol, moduleFactory: ModuleFactoryProtocol, controller: TabBarDelegateProtocol) {
        self.router = router
        self.coordinatorFactory = coordinator
        self.moduleFactory = moduleFactory
        self.tabBarDelegateProtocol = controller
    }

    override func start() {
        tabBarDelegateProtocol.onViewDidAppear = runRecomendationsFlow()
        tabBarDelegateProtocol.onRecomendationsFlowSelect = runRecomendationsFlow()
        tabBarDelegateProtocol.onLibraryFlowSelect = runLibraryFlow()
        tabBarDelegateProtocol.onProfileFlowSelect = runProfileFlow()
    }
}

// MARK: - Configure flows actions
extension TabBarCoordinator {
    private func runRecomendationsFlow() -> ((UINavigationController) -> Void) {
        return { [unowned self] navigationController in
            if navigationController.viewControllers.isEmpty {
                let routerWithNC = Router(rootController: navigationController)
                let recoCoordinator = RecomendationsCoordinator(router: routerWithNC, coordinator: coordinatorFactory, moduleFactory: moduleFactory)
                self.addDependency(recoCoordinator)
                recoCoordinator.start()
            }
        }
    }

    private func runLibraryFlow() -> ((UINavigationController) -> Void) {
        return { [unowned self] navigationController in
            if navigationController.viewControllers.isEmpty {
                let routerWithNC = Router(rootController: navigationController)
                let libraryCoordinator = LibraryCoordinator(router: routerWithNC, coordinator: coordinatorFactory, moduleFactory: moduleFactory)
                self.addDependency(libraryCoordinator)
                libraryCoordinator.start()
            }
        }
    }

    private func runProfileFlow() -> ((UINavigationController) -> Void) {
        return { [unowned self] navigationController in
            if navigationController.viewControllers.isEmpty {
                let routerWithNC = Router(rootController: navigationController)
                let profileCoordinator = ProfileCoordinator(router: routerWithNC, coordinator: coordinatorFactory, moduleFactory: moduleFactory)
                profileCoordinator.flowCompletionHandler = { [weak self] in
                    guard let self else { return }
                    self.flowCompletionHandler?()
                    self.removeDependency(profileCoordinator)
                }
                self.addDependency(profileCoordinator)
                profileCoordinator.start()
            }
        }
    }
}
