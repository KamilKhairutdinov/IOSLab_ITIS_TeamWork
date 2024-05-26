//
//  BookSUIViewCell.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 26.05.2024.
//

import SDWebImageSwiftUI
import SwiftUI

// Камил Хайрутдинов
struct BookSUIViewCell: View {

    // MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            WebImage(url: book.formats.imageJPEG)
                .scaledToFit()
            Text(book.title)
                .font(.title)
        })
        .padding(.top, 10)
    }

    // MARK: - Variables
    private let book: BookFromApi
    @State private var image: UIImage = UIImage()

    // MARK: - Init
    init(book: BookFromApi) {
        self.book = book
    }
}
