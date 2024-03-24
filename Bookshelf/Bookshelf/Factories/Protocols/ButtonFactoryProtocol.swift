//
//  ButtonFactoryProtocol.swift
//  Bookshelf
//
//  Created by kerik on 24.03.2024.
//

import Foundation
import UIKit

protocol ButtonFactoryProtocol {
    // MARK: - Абрамов Кирилл
    func createBorderedButton(title: String, color: UIColor, action: UIAction) -> UIButton
    func createPlainButton(title: String, color: UIColor, action: UIAction) -> UIButton
}
