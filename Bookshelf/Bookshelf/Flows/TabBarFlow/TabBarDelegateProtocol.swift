//
//  TabBarDelegateProtocol.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

import UIKit

// MARK: - Бородач Евгения
protocol TabBarDelegateProtocol: AnyObject {
    var onViewDidAppear: ((UINavigationController) -> Void)? { get set }
    var onRecomendationsFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onLibraryFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onProfileFlowSelect: ((UINavigationController) -> Void)? { get set }
}
