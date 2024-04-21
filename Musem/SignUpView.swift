import SwiftUI

struct SignUpView: View {
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var inputImage: UIImage?
    @State private var image: Image? = Image(systemName: "person.circle.fill") // Default profile icon
    @State private var showingImagePicker = false

    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack {
                Text("Let's Sign You Up")
                    .font(.custom("Exo2-Bold", size: 36))
                    .foregroundColor(.white)
                    .padding(.top, 20) // Adjusted alignment function to padding for clarity and functionality.

                Button(action: {
                    self.showingImagePicker = true
                }) {
                    image?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120) // Set appropriate size
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 3)
                        .foregroundColor(.mpurple)
                }
                .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: self.$inputImage)
                }

                TextField("Email", text: $emailID)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.horizontal, 20)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.horizontal, 20)

                HStack {
                    Text("Forgot your password?")
                        .font(.custom("Roboto-Regular", size: 16))
                        .foregroundColor(.white)
                        .padding(.top)
                    Button("Click Here") {
                        // Action for forgot password
                    }
                    .font(.custom("Roboto-Regular", size: 16))
                    .foregroundColor(.white)
                    .padding(.top)
                }
                .padding(.bottom, 20)

                Button(action: {
                    // Handle login logic here
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .font(.custom("Exo2-Bold", size: 36))
                }
                .frame(width: 289, height: 66)
                .background(
                    RadialGradient(
                        gradient: Gradient(colors: [Color.mblue, Color.mpurple]),
                        center: .center,
                        startRadius: 20,
                        endRadius: 130
                    )
                )
                .cornerRadius(24)
                .overlay(
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.white.opacity(0.5), Color.white.opacity(0)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .cornerRadius(24)
                )
            }
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    SignUpView()
}
