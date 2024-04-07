//
//  MockVIewController.swift
//  BookshelfUnitTests
//
//  Created by Камил Хайрутдинов on 07.04.2024.
//

import UIKit
@testable import protocol Bookshelf.FlowController

// MARK: - Камил Хыйрутдинов
final class MockEmptyViewController: UIViewController, FlowController {
    var completionHandler: (() -> Void)?
}
