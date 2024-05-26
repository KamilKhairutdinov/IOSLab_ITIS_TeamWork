//
//  RecomendationsSwiftUIView.swift
//  Bookshelf
//
//  Created by Тимур Уваров on 26.05.2024.
//

// MARK: - Уваров Тимур

import SwiftUI

struct RecomendationsSwiftUIView: View {

    @ObservedObject var genre: Genre

    var body: some View {
        VStack(alignment: .center) {
            if books.isEmpty {
                ZStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .tint(.blue)
                }
                Text(genre.genre)
            } else {
                switch genre.genre {
                case "culture":
                    Text(genre.genre)
                    List(books) { book in
                        BookSUIViewCell(book: book)
                    }
                    .listStyle(PlainListStyle())
                default:
                    Text(genre.genre)
                    List(books) { book in
                        BookSUIViewCell(book: book)
                    }
                    .listStyle(PlainListStyle())
                }
            }
        }
            .onAppear(perform: {
                viewModel.fechBooks { books in
                    self.books = books
                }
            })
    }

    @StateObject var viewModel: RecomendationsViewModel
    @State private var books: [BookFromApi] = []
}
