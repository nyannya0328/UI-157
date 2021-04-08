//
//  MulitieView.swift
//  UI-157
//
//  Created by にゃんにゃん丸 on 2021/04/06.
//

import SwiftUI

struct MulitieView: View {
    @StateObject var multiModel = MultiViewModel()
    init() {
        UIScrollView.appearance().bounces = false
    }
    var body: some View {
        ScrollView{
            
            
            HStack(alignment: .top, spacing: 15) {
                
                Image("p2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70,alignment: .center)
                    .clipShape(Circle())
                
                
                VStack(alignment: .leading, spacing: 15) {
                   (
                   
                   Text("Lion  ")
                    .fontWeight(.bold)
                    
                    +
                    
                    Text("King")
                    .foregroundColor(.gray)
                   
                   
                   )
                    
                    
                Text("#king #ios #Swift UI")
                    .foregroundColor(.blue)
                    
                    Text("Nyan Nyan")
                    
                    let columns = Array(repeating: GridItem(.flexible(),spacing: 30), count: 2)
                    
                    LazyVGrid(columns: columns,alignment : .leading, spacing: 15, content: {
                        
                        ForEach(multiModel.allImages.indices,id:\.self){index in
                            
                            GridImageView(index: index)
                            
                            
                        }
                        
                        
                    })
                    .padding(.top)
                
                }
               
                
            }
            .padding(.top,60)
          
            .frame(maxWidth: .infinity, alignment: .leading)
           
            
        }
        .overlay(
            ZStack{
                
                if multiModel.showImageViewer{
                    
                    Color.black
                        .ignoresSafeArea()
                        .opacity(multiModel.bgopcity)
                    
                    
                    ImageViewer()
                    
                }
            }
        
        )
        .environmentObject(multiModel)
    }
}

struct MulitieView_Previews: PreviewProvider {
    static var previews: some View {
        MulitieView()
    }
}
