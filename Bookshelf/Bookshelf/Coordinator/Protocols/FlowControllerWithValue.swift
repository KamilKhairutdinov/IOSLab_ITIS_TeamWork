//
//  FlowControllerWithValue.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import Foundation

// MARK: - Хайрутдинов Камил
protocol FlowControllerWithValue: AnyObject {
    associatedtype OutValue
    var completionHandler: ((OutValue) -> Void)? { get set }
}
