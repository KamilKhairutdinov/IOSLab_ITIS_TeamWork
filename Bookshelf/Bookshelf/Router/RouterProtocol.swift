//
//  RouterProtocol.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import UIKit

// MARK: - Хайрутдинов Камил
protocol RouterProtocol {
    func present(_ controller: UIViewController, animated: Bool)

    func push(_ controller: UIViewController, animated: Bool)
    func push(_ controller: UIViewController, animated: Bool, hideBottomBar: Bool)

    func pop(animated: Bool)
    func popToRootController(animated: Bool)

    func dismiss(animated: Bool)

    func setRootController(_ controller: UIViewController, isNavigationBarHidden: Bool)
    func setRootController(_ controller: UIViewController)
}
