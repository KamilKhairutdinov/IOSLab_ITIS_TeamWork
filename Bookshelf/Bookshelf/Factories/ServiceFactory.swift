//
//  ServiceFactory.swift
//  Bookshelf
//
//  Created by Rustem on 24.03.2024.
//

import Foundation

// MARK: - Уваров Тимур
class ServiceFactory: ServiceFactoryProtocol {
    func createSignUpService() -> AuthServiceProtocol {
        return AuthService()
    }

    func createValidationService() -> ValidationServiceProtocol {
        return ValidationService()
    }
}
