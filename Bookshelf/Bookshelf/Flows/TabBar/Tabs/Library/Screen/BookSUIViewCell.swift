//
//  BookSUIViewCell.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 26.05.2024.
//

import SwiftUI
import SDWebImageSwiftUI

// Камил Хайрутдинов
struct BookSUIViewCell: View {

    // MARK: - Body
    var body: some View {
        VStack {
           WebImae
            Text(book.title)
        }
    }

    init(book: BookFromApi) {
        self.book = book
    }

    // MARK: - Variables
    private let book: BookFromApi
}
