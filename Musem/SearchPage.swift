//
//  SearchPage.swift
//  Musem
//
//  Created by Shaundra Hamilton on 4/21/24.
//

import SwiftUI

struct SearchPage: View {
    @State private var searchText = ""
    
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
                Text("Search")
                    .font(.custom("Exo2-Bold", size: 36))
                    .padding(.horizontal)
                    .foregroundStyle(Color.white)
                    .hAlign(.topLeading)
                ScrollView {
                    SearchBar(text: $searchText)
                }
                Text("Categories")
                    .font(.custom("Lato-Regular", size: 24))
                    .foregroundColor(.white)
                    .hAlign(.leading)
                    .padding()
                ScrollView(.horizontal){
                    HStack{
                        ZStack{
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
                            
                            Button() {
                                // Handle login logic here
                            } label: {
                                Text("Singer")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .hAlign(.center)
                                    .font(.custom("Lato-Regular", size: 24))
                                    .foregroundColor(.white)
                            }
                        }
                        ZStack{
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
                            
                            Button() {
                                // Handle login logic here
                            } label: {
                                Text("Rapper")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .hAlign(.center)
                                    .font(.custom("Lato-Regular", size: 24))
                                    .foregroundColor(.white)
                            }
                        }
                        ZStack{
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
                            
                            Button() {
                                // Handle login logic here
                            } label: {
                                Text("Musician")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .hAlign(.center)
                                    .font(.custom("Lato-Regular", size: 24))
                                    .foregroundColor(.white)
                            }
                        }
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
                            
                            Button() {
                                // Handle login logic here
                            } label: {
                                Text("Producer")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .hAlign(.center)
                                    .font(.custom("Lato-Regular", size: 24))
                                    .foregroundColor(.white)
                            }
                        }
                    } // end of hstack
                }
                .padding()
                Text("Genre")
                    .font(.custom("Lato-Regular", size: 24))
                    .foregroundColor(.white)
                    .hAlign(.leading)
                    .padding()
                ScrollView(.horizontal){
                    HStack{
                        ZStack{
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
                            
                            Button() {
                                // Handle login logic here
                            } label: {
                                Text("Pop")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .hAlign(.center)
                                    .font(.custom("Lato-Regular", size: 24))
                                    .foregroundColor(.white)
                            }
                        }
                        ZStack{
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
                            
                            Button() {
                                // Handle login logic here
                            } label: {
                                Text("Rap")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .hAlign(.center)
                                    .font(.custom("Lato-Regular", size: 24))
                                    .foregroundColor(.white)
                            }
                        }
                        ZStack{
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
                            
                            Button() {
                                // Handle login logic here
                            } label: {
                                Text("RnB")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .hAlign(.center)
                                    .font(.custom("Lato-Regular", size: 24))
                                    .foregroundColor(.white)
                            }
                        }
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
                            
                            Button() {
                                // Handle login logic here
                            } label: {
                                Text("Jazz")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .hAlign(.center)
                                    .font(.custom("Lato-Regular", size: 24))
                                    .foregroundColor(.white)
                            }
                        }
                        ZStack{
                            Rectangle()
                                .fill(
                                    RadialGradient(
                                        gradient: Gradient(colors: [Color.mblue, Color.mpurple]),
                                        center: .center,
                                        startRadius: -20,
                                        endRadius: 120
                                    )
                                )
                                .frame(width: 110, height: 66)
                                .cornerRadius(24)
                            Rectangle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.5), Color.white.opacity(0)]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .frame(width: 110, height: 66)
                                .cornerRadius(24)
                            
                            Button() {
                                // Handle login logic here
                            } label: {
                                Text("Country")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .hAlign(.center)
                                    .font(.custom("Lato-Regular", size: 24))
                                    .foregroundColor(.white)
                            }
                        }
                        ZStack{
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
                            
                            Button() {
                                // Handle login logic here
                            } label: {
                                Text("Rock")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .hAlign(.center)
                                    .font(.custom("Lato-Regular", size: 24))
                                    .foregroundColor(.white)
                            }
                        }
                    } // end of hstack
                }
                .padding()
            }
            
        }
    }
}
struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
            HStack {
                // Magnifying glass icon
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
                
                // Search text field
                TextField("Search...", text: $text)
                    .padding(7)
                    .padding(.horizontal, 10)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            if isEditing {
                                Button(action: {
                                    self.text = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.leading, 200.0)
                                }
                            }
                        }
                    )
                    .onTapGesture {
                        self.isEditing = true
                    }
                
                // Cancel button
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.text = ""
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }) {
                        Text("Cancel")
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing, 1)
                }
            }
            .padding(.horizontal, 10)
           
        }
    }


#Preview {
    SearchPage()
}
