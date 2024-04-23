import SwiftUI

struct LoginView: View {
    
    @State var emailID: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            Color("background") // Ensure this color is defined in your asset catalog
                .ignoresSafeArea()
            VStack {
                Text("Let's Sign You In")
                    .font(.custom("Exo2-Bold", size: 36))
                    .foregroundColor(.white)
                    .padding()
                
                Text("Please enter your email and password.")
                    .font(.custom("Lato-Regular", size: 24))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                
                TextField("Email", text: $emailID)
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
                    
                    Text("Forgot your password?")
                        .font(.custom("Roboto-Regular", size: 16))
                        .foregroundColor(.white)
                        .padding(.top)
                    Button("Click Here"){
                        
                    }
                    .padding(.top)
                    .font(.custom("Roboto-Regular", size: 16))
                        .foregroundColor(.white)
                }
                .padding(.bottom)
                .hAlign(.center)
                ZStack {
                    Rectangle()
                        .fill(
                            RadialGradient(
                                gradient: Gradient(colors: [Color.mblue, Color.mpurple]),
                                center: .center,
                                startRadius: -20,
                                endRadius: 120
                            )
                        )
                        .frame(width: 289, height: 66)
                        .cornerRadius(24)
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.white.opacity(0.5), Color.white.opacity(0)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(width: 289, height: 66)
                        .cornerRadius(24)
                    
                    Button() {
                        // Handle login logic here
                    } label: {
                        Text("Log In")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .hAlign(.center)
                        .font(.custom("Exo2-Bold", size: 36))
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

extension View {
    func hAlign(_ alignment: Alignment) -> some View {
        self.frame(maxWidth: .infinity, alignment: alignment)
    }

    func vAlign(_ alignment: Alignment) -> some View {
        self.frame(maxHeight: .infinity, alignment: alignment)
    }
}

// Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
