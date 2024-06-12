//
//  NotificationPage.swift
//  Musem
//
//  Created by Shaundra Hamilton on 4/21/24.
//

import SwiftUI

struct NotificationPage: View {
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            Text("Notifications")
                .font(.custom("Exo2-Bold", size: 26))
                .foregroundColor(.white)
                .padding()
                .hAlign(.leading)
        }
    }
}
struct NotificationView: View {
    @State private var notifications = [
        "Shawn commented on your post",
        "DJ followed you",
        "Lyric liked your post",
        "Ant reposted your post",
        "Kelly requested to follow you",
        "Ray shared a song", 
        "Mike shared a playlist"
        
        
         
        

        
        
    ]
    
    var body:  some View {
        Text ("Notification")
        
    }
}

#Preview {
    NotificationPage()
}
