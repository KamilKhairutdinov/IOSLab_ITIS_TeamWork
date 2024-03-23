//
//  CoordinatorProtocol.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import Foundation

protocol CoordinatorProtocol: AnyObject {
    var flowComplitionHandler: (() -> Void)? { get set }
    func start()
}
