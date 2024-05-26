//
//  LibrarySUIView.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 26.05.2024.
//

import SwiftUI

struct LibrarySUIView: View {

    @StateObject var viewModel: LibraryViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    LibrarySUIView(viewModel: LibraryViewModel())
}
