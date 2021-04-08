//
//  SlideTabButton.swift
//  UI-157
//
//  Created by にゃんにゃん丸 on 2021/04/04.
//

import SwiftUI

struct SlideTabButton: View {
    @Binding var selectedTab : String
    @Namespace var animation
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Image("p2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
                .padding(.top,55)
            
            VStack(alignment: .leading, spacing: 15, content: {
                Text("Lion Maru")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("View Profile")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .opacity(0.8)
                    
                   
                    
                    
                })
                
                
                VStack(alignment: .leading, spacing: 15, content: {
                    TabButton(title: "BALL", image: "house.circle", selectedTab: $selectedTab, animation: animation)
                    
                    TabButton(title: "Movie", image: "airplayvideo", selectedTab: $selectedTab, animation: animation)
                    
                    TabButton(title: "Smaile", image: "face.dashed.fill", selectedTab: $selectedTab, animation: animation)
                    
                    TabButton(title: "Clock", image: "alarm", selectedTab: $selectedTab, animation: animation)
                    
                    TabButton(title: "Settings", image: "gear", selectedTab: $selectedTab, animation: animation)
                    
                    
                })
                .padding(.leading,-15)
                .padding(.top,30)
                
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 15, content: {
                    TabButton(title: "Log Out", image: "rectangle.righthalf.inset.fill.arrow.right", selectedTab: .constant(""), animation: animation)
                })
                
                .padding(.leading,-15)
            })
            
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SlideTabButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
