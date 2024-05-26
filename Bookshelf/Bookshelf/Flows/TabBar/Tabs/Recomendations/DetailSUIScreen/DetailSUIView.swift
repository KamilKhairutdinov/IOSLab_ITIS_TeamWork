//
//  DetailSUIView.swift
//  Bookshelf
//
//  Created by evaklq on 2024-05-26.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailSUIView: View {
    var book: BookFromApi
    let imageService = ImageNetworkService()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                // Картинка книги
                WebImage(url: URL(string: imageService.getURL().absoluteString))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                    .frame(height: 300)
                    .shadow(radius: 7)

                Text(book.title)
                    .font(.title)
                    .fontWeight(.bold)

                Text("Автор \(book.authors[0].name)")
                    .font(.title3)
                    .foregroundColor(.secondary)

                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(String(format: "%.1f", book.downloadCount))
                        .fontWeight(.semibold)
                }

                Button(action: {
                }) {
                    Text("Лайк")
                        .bold()
                        .frame(width: 280, height: 44)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
            .padding()
        }
        .navigationTitle("Информация о книге")
        .navigationBarTitleDisplayMode(.inline)
    }
}
