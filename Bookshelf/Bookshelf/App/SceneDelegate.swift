//
//  SceneDelegate.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let router = Router(rootController: UINavigationController())
        let coordinatorFactory = CoordinatorFactory()
        appCoordinator = coordinatorFactory.createAppCoordinator(router: router, coordinatorFactory: coordinatorFactory)

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = router.presenter()

        appCoordinator?.start()
        window?.makeKeyAndVisible()

    }

}

