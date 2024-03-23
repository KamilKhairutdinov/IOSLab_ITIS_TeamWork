//
//  FlowControllerWithValue.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import Foundation

protocol FlowControllerWithValue: AnyObject {
    associatedtype OutValue
    var complitionHandler: ((OutValue) -> Void)? { get set }
}
