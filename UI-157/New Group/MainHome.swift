//
//  MainHome.swift
//  UI-157
//
//  Created by にゃんにゃん丸 on 2021/04/04.
//

import SwiftUI

struct MainHome: View {
    @Binding var selectedTab :String
    
    init(selectedTab : Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection:$selectedTab){
            
        RotteateBall()
                .tag("BALL")
            
            Home()
                .tag("Movie")
                
                
            
        CountView()
                .tag("Smaile")
            
           ClockView()
                .tag("Clock")
            
            MulitieView()
                .tag("Settings")
            
            
            
        }
    }
}

struct MainHome_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct A : View {
    var body: some View{
        NavigationView{
            
            Text("A")
        }
    }
}

struct B : View {
    var body: some View{
        
        NavigationView{
            Text("B")
        }
    }
}

struct C : View {
    var body: some View{
        
        Text("C")
    }
}

struct D : View {
    var body: some View{
        
        Text("D")
    }
}



