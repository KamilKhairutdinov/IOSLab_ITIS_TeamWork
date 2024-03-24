//
//  ValidationServiceProtocol.swift
//  Bookshelf
//
//  Created by Rustem on 24.03.2024.
//

import Foundation

// MARK: - Уваров Тимур

protocol ValidationServiceProtocol {
    func validateUser(_ email: String, _ password: String, _ passwordConfirmation: String) -> [String]
}
