//
//  LibrarySUIView.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 26.05.2024.
//

import SwiftUI
// Камил Хайрутдинов
struct LibrarySUIView: View {

    // MARK: - body
    var body: some View {
        VStack(alignment: .center) {
            if books.isEmpty {
                ZStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .tint(.blue)
                }
            } else {
                List(books) { book in
                    BookSUIViewCell(book: book)
                }
                .listStyle(PlainListStyle())
            }
        }
            .onAppear(perform: {
                viewModel.fechBooks { books in
                    self.books = books
                }
            })
    }

    // MARK: - Variable
    @StateObject var viewModel: LibraryViewModel
    @State private var books: [BookFromApi] = []
}

