//
//  SwiftUIView.swift
//  Bookshelf
//
//  Created by kerik on 26.05.2024.
//

import SwiftUI

// Кирилл Абрамов
struct EditProfileView: View {
    @StateObject private var viewModel: EditProfileViewModel
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @Environment(\.presentationMode) var presentationMode

    init(viewModel: EditProfileViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            if let image = viewModel.profileImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    .onTapGesture {
                        showingImagePicker = true
                    }
            } else {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 150, height: 150)
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    .onTapGesture {
                        showingImagePicker = true
                    }
            }

            TextField("Имя", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200)
                .padding()

            Button("Сохранить") {
                viewModel.saveProfile()
                presentationMode.wrappedValue.dismiss()
            }
            .padding()

            Spacer()
        }
        .padding(.top, 50)
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in
            viewModel.updateProfileImage(image: inputImage)
        }
        .navigationTitle("Редактирование")
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            picker.dismiss(animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}
