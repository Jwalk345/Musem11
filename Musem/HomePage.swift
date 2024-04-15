//
//  SwiftUIView.swift
//  Musem
//
//  Created by Justin Walker on 4/15/24.
//

import SwiftUI

struct SwiftUIView: View {
  @State var texthere = ""
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                HStack{
                    Image("icon")
                        .padding()
                      //  .frame(alignment: .leading)
                    Spacer(minLength: 100)
                    Image("icon2")
                     //   .frame(alignment: .trailing)
                        .padding()
                    
                }.scaledToFit()
                Divider()
                .background(.white)
                .bold()
                .padding()
            
                HStack{
                    Image("icon")
                        .scaledToFit()
                    
                    
                        Form{
                            TextField("Name", text: $texthere)
                                .background(.white)
                        }.background(.gray)
                            .cornerRadius(10)
                            .frame(width: 400, height: 104, alignment: .trailing)
                    
                }
                HStack{
                    Image("icon")
                        .scaledToFit()
                    
                    
                        Form{
                            TextField("Name", text: $texthere)
                                .background(.white)
                        }.background(.gray)
                            .cornerRadius(10)
                            .frame(width: 400, height: 104, alignment: .trailing)
                    
                }
                HStack{
                    Image("icon")
                        .scaledToFit()
                    
                    
                        Form{
                            TextField("Name", text: $texthere)
                                .background(.white)
                        }.background(.gray)
                            .cornerRadius(10)
                            .frame(width: 400, height: 104, alignment: .trailing)
                    
                }
                HStack{
                    Image("icon")
                        .scaledToFit()
                    
                    
                        Form{
                            TextField("Name", text: $texthere)
                                .background(.white)
                        }.background(.gray)
                            .cornerRadius(10)
                            .frame(width: 400, height: 104, alignment: .trailing)
                    
                }
            }
            
            
        }
      
        
    }
    
}

#Preview {
    SwiftUIView()
}
