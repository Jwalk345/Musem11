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
                        .padding()
                    Spacer(minLength: 100)
                    Image("icon2")
                        .padding()
                }
                .scaledToFit()

                Divider()
                    .background(Color.white)
                    .bold()
                    .padding()
                Text("Search")
                    .font(.custom("Exo2-Bold", size: 36))
                    .padding()
                    .foregroundStyle(Color.white)
                    .hAlign(.topLeading)
                ScrollView {
                    SearchBar(text: $searchText)
                        .padding()
                }
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
