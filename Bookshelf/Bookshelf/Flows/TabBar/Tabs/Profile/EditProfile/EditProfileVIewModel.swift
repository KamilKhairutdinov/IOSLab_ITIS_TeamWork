//
//  EditProfileVIewModel.swift
//  Bookshelf
//
//  Created by kerik on 26.05.2024.
//

import SwiftUI

// Кирилл Абрамов
class EditProfileViewModel: ObservableObject {
    @Published var name: String
    @Published var profileImage: UIImage?
    var onSave: ((String, UIImage?) -> Void)?

    init(name: String, profileImage: UIImage?) {
        self.name = name
        self.profileImage = profileImage
    }

    func updateProfileImage(image: UIImage?) {
        self.profileImage = image
    }

    func saveProfile() {
        onSave?(name, profileImage)
    }
}
