//
//  TextFieldFactory.swift
//  Bookshelf
//
//  Created by Rustem on 24.03.2024.
//

import UIKit

// MARK: - Уваров Тимур
class TextFieldFactory {

    func createSignUpTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 24)
        textField.layer.cornerRadius = 8
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .placeholderText
        textField.textColor = .black
        textField.placeholder = placeholder

        return textField
    }

    public static var shared = TextFieldFactory()
}
