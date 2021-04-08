//
//  TabButton.swift
//  UI-157
//
//  Created by にゃんにゃん丸 on 2021/04/04.
//

import SwiftUI

struct TabButton: View {
    var title : String
    var image : String
    @Binding var selectedTab :String
    var animation : Namespace.ID
    var body: some View {
        Button(action: {
            
            withAnimation(.spring()){
                
                selectedTab = title
            }
        }, label: {
            HStack(spacing:15){
                
                Image(systemName: image)
                    .font(.title2)
                    .frame(width: 30)
                
                Text(title)
                    .fontWeight(.bold)
                
            }
            .foregroundColor(selectedTab == title ? .blue : .white)
            .padding(.vertical,10)
            .padding(.horizontal)
           // .frame(width: getRect().width,alignment: .leading)
            .background(
            
                ZStack{
                    
                    if selectedTab == title{
                        
                        Color.white.opacity(selectedTab == title ? 1 : 0)
                            .clipShape(CustomCorner(corner: [.topRight,.bottomRight], size: 15))
                            .matchedGeometryEffect(id: "TAB", in: animation)
                        
                    }
                }
            
            )
        })
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}
