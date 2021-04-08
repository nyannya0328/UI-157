//
//  RotteateBall.swift
//  UI-157
//
//  Created by にゃんにゃん丸 on 2021/04/05.
//

import SwiftUI

struct RotteateBall: View {
    @State var roteteBall = false
    @State var showPopUp = false
    
    @Environment(\.colorScheme) var scherm
    var body: some View {
        VStack{
            Toggle(isOn: $roteteBall) {
                Text("Rotate Ball")
                
                
            }
            .padding()
            .padding(.vertical)
            
            Button(action: {
                
                withAnimation(.spring()){
                    
                    showPopUp.toggle()
                }
            }) {
                
                Text("Show Pop UP")
                    .foregroundColor(.blue)
                    .padding(.vertical)
                    .padding(.horizontal,25)
                    .background(scherm == .dark ? Color.black : Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
               .overlay(
                   ZStack{
                       
                       if showPopUp{
                           
                           
                           Color.primary.opacity(0.2)
                               .ignoresSafeArea()
                            .onTapGesture {
                                if showPopUp {
                                    
                                    showPopUp.toggle()
                                }
                            }
                        
                        DribbleAnimation(roteBall: $roteteBall, showPopup: $showPopUp)
                           
                            .offset(y: showPopUp ? 300 : getRect().height)
                       }
                   }
               
               )
        
        
       
    }
}

struct RotteateBall_Previews: PreviewProvider {
    static var previews: some View {
        RotteateBall()
    }
}

struct DribbleAnimation : View {
    @Environment(\.colorScheme) var scherm
    @Binding var roteBall : Bool
    @Binding var showPopup : Bool
    
    @State var animatedBall = false
    @State var animatedRotation = false
    var body: some View{
        
        
        ZStack{
            
            (scherm == .dark ? Color.black : Color.white)
                .frame(width: getRect().width, height: getRect().height / 3)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
            
          
            
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 40, height: 40)
                .rotation3DEffect(.init(degrees: 60), axis: (x: 1, y: 0, z: 0.0), anchor: .center, anchorZ: 0.0, perspective: 1.0)
                .offset(y: 35)
                .opacity(animatedBall ? 1 : 0)
                Image("p4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .rotationEffect(.init(degrees: roteBall && animatedRotation ? 360 : 0))
                    .offset(y: animatedBall ? 10 : -25)

            Image("p4")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .rotationEffect(.init(degrees: roteBall && animatedRotation ? 360 : 0))
                .offset(y: animatedBall ? -100 : -25)

                
            
            
        }
        .onAppear(perform: {
            
            doAnimation()
            
        })
        
        
        
    }
    
    func doAnimation(){
        
        withAnimation(Animation.easeInOut(duration: 0.4).repeatForever(autoreverses: true)){
            
            animatedBall.toggle()
            
        }
        
        withAnimation(Animation.linear(duration: 0.1).repeatForever(autoreverses: false)){
            
            animatedRotation.toggle()
            
        }
        
    }
}
