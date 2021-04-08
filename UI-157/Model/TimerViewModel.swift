//
//  TimerViewModel.swift
//  UI-157
//
//  Created by にゃんにゃん丸 on 2021/04/05.
//

import SwiftUI
import UserNotifications

class TimerViewModel: NSObject,UNUserNotificationCenterDelegate, ObservableObject {
    
    
    @Published var time : Int = 0
    @Published var selectedTime : Int = 0
    @Published var buttonAnimation = false
    
    
    @Published var timerViewoffset : CGFloat = UIScreen.main.bounds.height
    
    @Published var timerHeightChange : CGFloat = 0
    
    @Published var leftTime :Date = Date()
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.banner,.sound])
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    
 
    
    
    func restView(){
        time = 0
        timerHeightChange = 0
        selectedTime = 0
        buttonAnimation = false
        timerViewoffset = UIScreen.main.bounds.height
    }
    
    func performNotifications(){
        
        
        let content = UNMutableNotificationContent()
        content.title = "From Girl"
        content.body = "Timer has been finished"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(time), repeats: false)
        
        let reQuest = UNNotificationRequest(identifier: "Timer", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(reQuest) { (err) in
            if err != nil{
                
                
                print(err!.localizedDescription)
                
            }
        }
    }
}

