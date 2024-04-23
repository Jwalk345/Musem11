//
//  ContentView.swift
//  Musem
//
//  Created by Justin Walker on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    init() {
        // Set the unselected tab bar item color to white
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        
        // Set the general tint color which applies to the selected item
        UITabBar.appearance().tintColor = UIColor.systemPink
        
        // Optional: Change the background color of the Tab Bar if needed
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Image(systemName: "megaphone.fill")
                    Text("Bids")
                }
            
            SearchPage()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            NotificationPage()
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("Notifications")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(.accent) // This sets the selected icon and text color to pink
    }
}

#Preview {
    ContentView()
}
