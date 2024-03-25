//
//  LabelFactoryProtocol.swift
//  Bookshelf
//
//  Created by evaklq on 2024-03-25.
//

import UIKit

protocol LabelFactoryProtocol {
    // MARK: - Бородач Евгения
    associatedtype AnyColor

    func createDefaultLabel(text: String, color: AnyColor, fontSize: CGFloat, weight: UIFont.Weight) -> UILabel
}
