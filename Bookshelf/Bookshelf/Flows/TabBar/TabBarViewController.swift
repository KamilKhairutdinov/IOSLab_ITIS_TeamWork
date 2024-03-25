//
//  TabBarViewController.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

import UIKit

// MARK: - Бородач Евгения
class TabBarViewController: UITabBarController, TabBarDelegateProtocol {
    // MARK: - Declaration objects
    var onViewDidAppear: ((UINavigationController) -> Void)?
    var onRecomendationsFlowSelect: ((UINavigationController) -> Void)?
    var onLibraryFlowSelect: ((UINavigationController) -> Void)?
    var onProfileFlowSelect: ((UINavigationController) -> Void)?

    // MARK: - Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func viewDidAppear(_ animated: Bool) {
        if let controller = customizableViewControllers?.first as? UINavigationController {
            onViewDidAppear?(controller)
        }
    }
}

// MARK: - Configure ui items
extension TabBarViewController {
    private func configureView() {
        setupTabs()
        tabBar.unselectedItemTintColor = UIColor.systemBlue
        tabBar.tintColor = UIColor.blue
        delegate = self
        view.backgroundColor = .white
    }

    private func setupTabs() {
        setViewControllers([
            setupControllerForTabBar(imageName: "book.circle.fill"),
            setupControllerForTabBar(imageName: "books.vertical.circle"),
            setupControllerForTabBar(imageName: "person")
        ], animated: true)
    }

    private func setupControllerForTabBar(imageName: String) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.tabBarItem.image = UIImage(systemName: imageName)
        navigationController.tabBarItem.selectedImage = UIImage(systemName: imageName)

        return navigationController
    }
}

// MARK: - TabBar Delegate
extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }

        switch selectedIndex {
        case 0:
            onRecomendationsFlowSelect?(controller)
        case 1:
            onLibraryFlowSelect?(controller)
        case 2:
            onProfileFlowSelect?(controller)
        default:
            print("Tab bar index out of range")
        }
    }
}
