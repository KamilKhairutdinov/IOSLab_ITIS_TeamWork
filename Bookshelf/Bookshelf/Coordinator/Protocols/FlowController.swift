//
//  FlowController.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import Foundation

protocol FlowController: AnyObject {
    var complitionHandler: (() -> Void)? { get set }
}
