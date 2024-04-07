//
//  MockWithValueVIewController.swift
//  BookshelfUnitTests
//
//  Created by Камил Хайрутдинов on 07.04.2024.
//

import UIKit
@testable import protocol Bookshelf.FlowControllerWithValue

enum MockStates {
    case exit, push
}

// MARK: - Камил Хыйрутдинов
final class MockWithValueVIewController: UIViewController, FlowControllerWithValue {
    var completionHandler: ((MockStates) -> Void)?
}
