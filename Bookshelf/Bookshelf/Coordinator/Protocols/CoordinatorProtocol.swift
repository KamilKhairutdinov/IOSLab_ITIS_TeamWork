//
//  CoordinatorProtocol.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import Foundation

// MARK: - Хайрутдинов Камил
protocol CoordinatorProtocol: AnyObject {
    var flowCompletionHandler: (() -> Void)? { get set }
    func start()
}
