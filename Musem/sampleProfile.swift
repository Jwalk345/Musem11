import SwiftUI

struct sampleProfile: View {
    var email: String
    var userName: String
    var software: String
    var birthDate: Date
    var selectedState: String
    var selectedCategories: [String]
    var selectedGenres: [String]
    var image: Image? // Add the image property

    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack {
                HStack {
                    Image("icon")
                        .padding(.leading)
                    Spacer(minLength: 100)
                    Image("icon2")
                        .padding(.trailing)
                }
                .scaledToFit()

                Divider()
                    .background(Color.white)
                    .bold()
                    .padding()
                
                // Profile Picture and Username
                HStack {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 125, height: 125)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 3)
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 125, height: 125)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 3)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(userName)
                            .font(.custom("Exo2-Bold", size: 36))
                            .padding(.top, 8)
                            .foregroundColor(.white)
                        
                        Text(selectedState)
                            .font(.custom("Lato-Regular", size: 20))
                            .foregroundColor(.white)
                        
                        Text(selectedCategories.joined(separator: ", "))
                            .font(.custom("Lato-Regular", size: 20))
                            .foregroundColor(.white)
                    }
                    .padding(.leading)
                }
                
                VStack(alignment: .leading) {
                Text("Genre")
                        .font(.custom("Exo2-Bold", size: 26))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .hAlign(.center)
                    Text(selectedGenres.joined(separator: ", "))
                        .font(.custom("Lato-Regular", size: 20))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .hAlign(.center)
                    Text("Software")
                            .font(.custom("Exo2-Bold", size: 26))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .hAlign(.center)
                    Text(software)
                        .font(.custom("Lato-Regular", size: 20))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .hAlign(.center)
                }
                .padding(.bottom)
                Text("Social Media")
                    .font(.custom("Lato-Regular", size: 24))
                    .foregroundColor(.white)
                    .hAlign(.leading)
                    .padding(.horizontal)
                
                ScrollView(.horizontal) {
                    HStack {
                        socialMediaButton(title: "Instagram")
                        socialMediaButton(title: "X")
                        socialMediaButton(title: "TikTok")
                        socialMediaButton(title: "SoundCloud")
                    }
                }
                .padding(.horizontal)

                Text("Recent Collabs")
                    .font(.custom("Lato-Regular", size: 24))
                    .foregroundColor(.white)
                    .hAlign(.leading)
                    .padding(.horizontal)
                
                ScrollView(.horizontal) {
                    HStack {
                        collabButton(title: "Pop")
                        collabButton(title: "Rap")
                        collabButton(title: "RnB")
                        collabButton(title: "Jazz")
                        collabButton(title: "Country")
                        collabButton(title: "Rock")
                    }
                }
                .padding(.horizontal)
            }
        }
    }

    private func socialMediaButton(title: String) -> some View {
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
                .frame(width: 120, height: 66)
                .cornerRadius(24)
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white.opacity(0.5), Color.white.opacity(0)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 120, height: 66)
                .cornerRadius(24)
            
            Button {
                // Handle button action here
            } label: {
                Text(title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.custom("Lato-Regular", size: 24))
            }
        }
    }

    private func collabButton(title: String) -> some View {
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
                .frame(width: 100, height: 66)
                .cornerRadius(24)
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white.opacity(0.5), Color.white.opacity(0)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 100, height: 66)
                .cornerRadius(24)
            
            Button {
                // Handle button action here
            } label: {
                Text(title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.custom("Lato-Regular", size: 24))
            }
        }
    }
}

#Preview {
    sampleProfile(
        email: "test@example.com",
        userName: "TestUser",
        software: "Logic Pro, Ableton Live",
        birthDate: Date(),
        selectedState: "California",
        selectedCategories: ["Producer"],
        selectedGenres: ["Rock", "Jazz"],
        image: Image(systemName: "person.circle.fill") // Replace with an actual image if available
    )
}
