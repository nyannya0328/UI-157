//
//  MainView.swift
//  UI-157
//
//  Created by にゃんにゃん丸 on 2021/04/04.
//

import SwiftUI

var gra = LinearGradient(gradient: .init(colors: [.blue,.red,.green,.purple]), startPoint: .bottom, endPoint: .top)



struct MainView: View {
    @State var selectedTab = "Home"
    @State var showMenu = false
   
    
    var body: some View {
        ZStack{
            
            gra
                .ignoresSafeArea()
            
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false, content: {
                
                
                SlideTabButton(selectedTab: $selectedTab)
                
            })
                
            
            ZStack{
                
                Color.white.opacity(0.7)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -25 : 0)
                    .padding(.vertical,30)
                
                Color.white.opacity(0.7)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -50 : 0)
                    .padding(.vertical,60)
                
                Color.white.opacity(0.7)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -75 : 0)
                    .padding(.vertical,90)
                
                Color.white.opacity(0.7)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -95 : 0)
                    .padding(.vertical,120)
                
                
                
                
                
                MainHome(selectedTab: $selectedTab)
                    .cornerRadius(showMenu ? 10 : 0)
            }
            .scaleEffect(showMenu ? 0.8 : 1)
            .offset(x: showMenu ? getRect().width - 120 : 0)
            .ignoresSafeArea()
        
            .overlay(
                Button(action: {
                    
                    withAnimation(.spring()){
                        
                        showMenu.toggle()
                    }
                }, label: {
                    VStack(spacing:5){
                        
                        Capsule()
                            .fill(showMenu ? Color.white : Color.primary)
                            .frame(width: 30, height: 3)
                            .rotationEffect(.init(degrees: showMenu ? -50 : 0))
                            .offset(x: showMenu ? 2 : 0, y: showMenu ? 9 : 0)
                        
                        VStack(spacing:5){
                            Capsule()
                                .fill(showMenu ? Color.white : Color.primary)
                                .frame(width: 30, height: 3)
                            
                            Capsule()
                                .fill(showMenu ? Color.white : Color.primary)
                                .frame(width: 30, height: 3)
                                .offset(y: showMenu ? -8 : 0)
                        }
                        .rotationEffect(.init(degrees: showMenu ? 50 : 0))
                        
                        
                    }
                })
                .padding()
                ,alignment: .topLeading
            )
           
            
         
          
            
           
            
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
