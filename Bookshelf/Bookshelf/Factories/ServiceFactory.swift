//
//  ServiceFactory.swift
//  Bookshelf
//
//  Created by Rustem on 24.03.2024.
//

import Foundation

// MARK: - Уваров Тимур
class ServiceFactory: ServiceFactoryProtocol {
    func createSignUpService() -> SignUpServiceProtocol {
        return SignUpService()
    }

    func createValidationService() -> ValidationServiceProtocol {
        return ValidationService()
    }
}
