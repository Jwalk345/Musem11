//
//  SwiftUIView.swift
//  Musem
//
//  Created by Justin Walker on 4/15/24.
//

import SwiftUI
import Firebase

struct HomePage: View {
    @State var audioData: Data?
    @State var texthere = ""
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                HStack{
                    Image("icon")
                        .padding()
                    Spacer(minLength: 100)
                    Image("icon2")
                        .padding()
                    
                }.scaledToFit()
                
                
                Divider()
                    .background(.white)
                    .bold()
                    .padding()
                
                // Feed Start
                
                ScrollView{
                    HStack{
                        Image("icon")
                            .scaledToFit()
                        
                        
                        Form{
                            TextField("Name", text: $texthere)
                                .background(.white)
                        }.background(.gray)
                            .cornerRadius(10)
                            .frame(width: 310, height: 104, alignment: .trailing)
                        
                    }
                    
                    
                }
            }
            
        }
    }
}
        
 

#Preview {
    HomePage()
}
