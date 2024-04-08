//
//  ServiceFactoryProtocol.swift
//  Bookshelf
//
//  Created by Rustem on 24.03.2024.
//

import Foundation

// MARK: - Уваров Тимур
protocol ServiceFactoryProtocol {
    func createSignUpService() -> AuthServiceProtocol
    func createValidationService() -> ValidationServiceProtocol
}
