//
//  CountView.swift
//  UI-157
//
//  Created by にゃんにゃん丸 on 2021/04/05.
//

import SwiftUI
import UserNotifications

struct CountView: View {
    @EnvironmentObject var timerModel : TimerViewModel
    
    
    var body: some View {
        
        ZStack{
            VStack{
                
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack{
                        
                        ForEach(1...6,id:\.self){index in
                            
                            let time = index * 5
                            
                            Text("\(time)")
                                .font(.system(size: 45))
                                .padding(.horizontal)
                                .frame(width: 100, height: 100)
                                .background(timerModel.time == time ? Color.purple : Color.green)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .onTapGesture {
                                    withAnimation{
                                        
                                        timerModel.time = time
                                        timerModel.selectedTime = time
                                        
                                    }
                                }
                                
                            
                        }
                    }
                    .padding() 
                    
                    
                    
                }
                .offset(y: 40)
                .opacity(timerModel.buttonAnimation ? 0 : 1)
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.easeIn(duration: 0.65)){
                        
                        
                        timerModel.buttonAnimation.toggle()
                        
                        
                    }
                    
                    withAnimation(Animation.easeIn.delay(0.6)){
                        
                        timerModel.timerViewoffset = 0
                    }
                    
                    
                        
                    timerModel.performNotifications()
                 
                    
                }) {
                    
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 80, height: 80)
                        .padding(.bottom,35)
                }
                .disabled(timerModel.time == 0)
                .opacity(timerModel.time == 0 ? 0.6 : 1)
                .offset(y: timerModel.buttonAnimation ? 300 : 0)
                
                
            }
            
            Color.red
                .overlay(
                
                    Text("\(timerModel.selectedTime)")
                        .font(.system(size: 60, weight: .heavy))
                
                )
                .frame(height: getRect().height - timerModel.timerHeightChange)
                .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .bottom)
            .ignoresSafeArea(.all, edges: .all)
               
                .offset(y: timerModel.timerViewoffset)
                
           
        }
         
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.ignoresSafeArea(.all, edges: .all))
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { (_) in
            if timerModel.selectedTime != 0 && timerModel.time != 0 && timerModel.buttonAnimation{
                
                timerModel.selectedTime -= 1
                
                let progressHeigth = getRect().height / CGFloat(timerModel.time)
                let diff = timerModel.time - timerModel.selectedTime
                withAnimation(.default){
                    
                    timerModel.timerHeightChange = CGFloat(diff) * progressHeigth
                    
                    
                }
                if timerModel.selectedTime == 0{
                    timerModel.restView()
                    
                }
                
            }
        }
        .onAppear(perform: {
            
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { (_, _) in
                
                
                
                
            }
            UNUserNotificationCenter.current().delegate = timerModel
            
        })
       
        
    }
    
    
    
}

struct CountView_Previews: PreviewProvider {
    static var previews: some View {
        CountView()
    }
}
