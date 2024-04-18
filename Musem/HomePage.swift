//
//  SwiftUIView.swift
//  Musem
//
//  Created by Justin Walker on 4/15/24.
//

import SwiftUI

struct HomePage: View {
  @State var texthere = ""
    @State var texthere1 = ""
    @State var texthere2 = ""
    @State var texthere3 = ""
    @State var texthere4 = ""
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
                ScrollView{
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
                            TextField("Name", text: $texthere1)
                                .background(.white)
                        }.background(.gray)
                            .cornerRadius(10)
                            .frame(width: 400, height: 104, alignment: .trailing)
                    
                }
                HStack{
                    Image("icon")
                        .scaledToFit()
                    
                    
                        Form{
                            TextField("Name", text: $texthere2)
                                .background(.white)
                        }.background(.gray)
                            .cornerRadius(10)
                            .frame(width: 400, height: 104, alignment: .trailing)
                    
                }
                    HStack{
                        Image("icon")
                            .scaledToFit()
                        
                        
                        Form{
                            TextField("Name", text: $texthere3)
                                .background(.white)
                        }.background(.gray)
                            .cornerRadius(10)
                            .frame(width: 400, height: 104, alignment: .trailing)
                    }
                }
            }
            
            
        }
      
        
    }
    
}

#Preview {
    HomePage()
}
