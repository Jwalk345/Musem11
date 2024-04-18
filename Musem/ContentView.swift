//
//  ContentView.swift
//  Musem
//
//  Created by Justin Walker on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomePage()
                .tabItem {
                Image(systemName: "house")
                    Text("Order")}
            
                
            
            
        }.onAppear() {
            UITabBar.appearance()
            
        }
       
    }
}

#Preview {
    ContentView()
}
