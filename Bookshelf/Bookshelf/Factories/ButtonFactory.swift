//
//  ButtonFactory.swift
//  Bookshelf
//
//  Created by kerik on 24.03.2024.
//

import UIKit
import Foundation

class ButtonFactory : ButtonFactoryProtocol {
    
    // MARK: - Абрамов Кирилл
    func createBorderedButton(title: String, color: UIColor, action: UIAction) -> UIButton {
        let button = UIButton(configuration: .bordered())
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 12
        button.tintColor = .clear
        button.backgroundColor = color
        button.addAction(action, for: .touchUpInside)
        return button
    }
    
    func createPlainButton(title: String, color: UIColor, action: UIAction) -> UIButton {
        let button = UIButton(configuration: .plain())
        button.setTitle(title, for: .normal)
        button.tintColor = .clear
        button.backgroundColor = color
        button.addAction(action, for: .touchUpInside)
        return button
    }
    
    
}
