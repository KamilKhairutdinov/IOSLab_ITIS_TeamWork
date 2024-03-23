//
//  FlowController.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import Foundation

// MARK: - Хайрутдинов Камил
protocol FlowController: AnyObject {
    var completionHandler: (() -> Void)? { get set }
}
