//
//  LabelFactory.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

import UIKit

// MARK: - Бородач Евгения
class LabelFactory: LabelFactoryProtocol {
    typealias AnyColor = UIColor

    func createDefaultLabel(text: String = "", color: UIColor = .black, fontSize: CGFloat = 20, weight: UIFont.Weight = .regular) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)

        return label
    }
}
