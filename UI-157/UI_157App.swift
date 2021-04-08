//
//  UI_157App.swift
//  UI-157
//
//  Created by にゃんにゃん丸 on 2021/04/03.
//

import SwiftUI

@main
struct UI_157App: App {
    @Environment(\.scenePhase) var scence
    @StateObject var timermodel = TimerViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(timermodel)
        }
        
        .onChange(of: scence) { (newScene) in
            if newScene == .background{
                
                timermodel.leftTime = Date()
                
                
                
            }
            
            if newScene == .active && timermodel.time != 0{
                
                
                let diff = Date().timeIntervalSince(timermodel.leftTime)
                let currenttime = timermodel.selectedTime - Int(diff)
                
                if currenttime >= 0{
                    
                    
                    withAnimation(.default){
                        
                        timermodel.selectedTime = currenttime
                    }
                }
                
                else{
                    
                    timermodel.restView()
                }
                
            }
        }
    }
}
