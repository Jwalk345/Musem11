
import SwiftUI

class AuthManager: ObservableObject {
    @Published var isLoggedIn: Bool = false
}

struct ProfileView: View {
    @State private var navigateToLogin = false
    @State private var navigateToSignUp = false
    @EnvironmentObject var authManager: AuthManager
    var body: some View {
        Group {
            if authManager.isLoggedIn {
                LoggedInView()
            } else {
                NavigationView {
                    ZStack {
                        Color.background.ignoresSafeArea()
                        VStack {
                            HStack {
                                Image("icon").padding()
                                Spacer(minLength: 100)
                                Image("icon2").padding()
                            }.scaledToFit()
                            
                            Divider()
                                .background(Color.white)
                                .bold()
                                .padding()
                            
                            ScrollView {
                                Text("You are not signed in. Please log in or create an account to access this feature.")
                                    .font(.custom("Exo2-Bold", size: 36))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color.white)
                                
                                // Login button with navigation link
                                NavigationLink(destination: LoginView(), isActive: $navigateToLogin) {
                                    Button("Log In") {
                                        navigateToLogin = true
                                    }
                                    .buttonStyle(GradientButtonStyle())
                                }
                                
                                // Signup button with navigation link
                                NavigationLink(destination: SignUpView(), isActive: $navigateToSignUp) {
                                    Button("Sign Up") {
                                        navigateToSignUp = true
                                    }
                                    .buttonStyle(CustomButtonStyle())
                                }
                            }
                        }
                    }
                    .navigationBarHidden(true)
                }
            }
        }
    }
}
        struct GradientButtonStyle: ButtonStyle {
            func makeBody(configuration: Self.Configuration) -> some View {
                configuration.label
                    .foregroundColor(.white)
                    .font(.custom("Exo2-Bold", size: 36))
                    .frame(width: 289, height: 66)
                    .background(
                        RadialGradient(
                            gradient: Gradient(colors: [Color.blue, Color.purple]),
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
                    .padding()
                    .scaleEffect(configuration.isPressed ? 0.95 : 1)
            }
        }

        struct CustomButtonStyle: ButtonStyle {
            func makeBody(configuration: Configuration) -> some View {
                configuration.label
                    .padding()
                    .font(.custom("Exo2-Bold", size: 36))
                    .background(
                        RoundedRectangle(cornerRadius: 26)
                            .fill(Color.white.opacity(0.3))
                            .frame(width: 289, height: 66)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 26)
                            .stroke(Color.white, lineWidth: 2)
                            .frame(width: 289, height: 66)
                    )
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }
//
// Logged in View
//
struct LoggedInView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to your profile!")
                // Display user profile information here
                Button("Log Out") {
                    authManager.isLoggedIn = false
                }
            }
            .navigationBarHidden(true)
        }
    }
}






struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(AuthManager())
    }
}
