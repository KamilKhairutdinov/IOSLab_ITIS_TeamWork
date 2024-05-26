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
        NavigationStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .tint(.blue)
                .scaleEffect(1.5)
                .onAppear(perform: {
                    viewModel.fechBooks { books in

                    }
                })
            VStack {
                List(books) { book in
                    BookSUIViewCell(book: book)
                }
            }
        }
    }

    // MARK: - Variables
    @StateObject var viewModel: LibraryViewModel
    private var books: [BookFromApi] = []
}

