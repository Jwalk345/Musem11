import SwiftUI

struct SignUpView: View {
    // account details
    @State  var emailID: String = ""
    @State  var password: String = ""
    @State private var inputImage: UIImage?
    @State private var image: Image? = Image(systemName: "person.circle.fill") // Default profile icon
    @State private var showingImagePicker = false
    @State var userName: String = ""
    @State private var showingStatePicker = false
    //
    @State var createAccount: Bool = false
    @State private var showingDatePicker = false
    // DateFormatter to format the date display
    private let dateRange: ClosedRange<Date> = {
            let calendar = Calendar.current
            let startComponents = DateComponents(year: 1900, month: 1, day: 1)
            let endComponents = DateComponents(year: Calendar.current.component(.year, from: Date()) + 50, month: 12, day: 31)
            return (calendar.date(from: startComponents) ?? Date())...(calendar.date(from: endComponents) ?? Date())
        }()
        
        private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .short // Or ".long" for a more detailed date
            return formatter
        }()
    // State Picker
    @State private var birthDate: Date = Date()
       let states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
       @State private var selectedState = "Alabama"
    
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
                        .padding()
                }
                .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: self.$inputImage)
                }
                
                TextField("Email", text: $emailID)
                    .padding()
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(5)
                    .padding(.horizontal, 20)
                TextField("Username", text: $userName)
                    .padding()
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(5)
                    .padding(.horizontal, 20)
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(5)
                    .padding(.horizontal, 20)
                HStack{
                    VStack{
                        Button(action: {
                            self.showingDatePicker.toggle()
                        }) {
                            HStack {
                                Text(showingDatePicker ? "Selecting Date..." : dateFormatter.string(from: birthDate))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }
                            .padding()
                            .background(Color.white.opacity(0.4))
                            .cornerRadius(5)
                         
                            .frame(width: 150)
                        }
                        
                        if showingDatePicker {
                            DatePicker("Date of Birth", selection: $birthDate, in: dateRange, displayedComponents: .date)
                                .datePickerStyle(WheelDatePickerStyle())
                                .labelsHidden()
                                .padding(.leading, 150)
                                .background(Color.white.opacity(0.5))
                                .cornerRadius(8)
                                
                            
                            Button("Done") {
                                self.showingDatePicker = false
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.mpurple)
                            .cornerRadius(8)
                        }
                    }
                    VStack{
                        Button(action: {
                            showingStatePicker.toggle()
                        }) {
                            HStack {
                                Text(showingStatePicker ? "Selecting State..." : selectedState)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding()
                            .background(Color.white.opacity(0.4))
                            .cornerRadius(5)
                            .frame(width: 200)
                        }
                        
                        if showingStatePicker {
                            Picker("Select State", selection: $selectedState) {
                                ForEach(states, id: \.self) {
                                    Text($0)
                                }
                            }
                            .labelsHidden()
                            .pickerStyle(WheelPickerStyle())
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(8)
                            .padding(.horizontal, 20)
                            
                            Button("Done") {
                                showingStatePicker = false
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.mpurple)
                            .cornerRadius(8)
                        }
                    }
                }
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
                
                Button("Sign Up"){
                    // Handle login logic here
                    createAccount.toggle()
                }
                .foregroundColor(.white)
                .font(.custom("Exo2-Bold", size: 36))
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
