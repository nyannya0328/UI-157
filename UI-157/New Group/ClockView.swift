//
//  ClockView.swift
//  UI-157
//
//  Created by にゃんにゃん丸 on 2021/04/06.
//

import SwiftUI

struct ClockView: View {
    @State var dark = false
    
    @State var currentTime = Time(min: 0, sec: 0, hour: 0)
    @State var reciVer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    var body: some View {
        
        VStack{
            
            
            HStack{
                
                
                Text("Analog Clock")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
                
                Spacer()
                
                Button(action: {
                    
                    dark.toggle()
                }) {
                    Image(systemName: dark ? "moon.fill" : "sun.min.fill")
                        .font(.system(size: 22))
                        .foregroundColor(dark ? .black : .white)
                        .padding(10)
                        .background(Color.primary)
                        .clipShape(Circle())
                       
                }
                
                
                
            }
            .padding(.horizontal)
            
            Spacer()
            
            
            ZStack{
                
                
                Image("p2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                
                
                   
                    
                
                ForEach(0..<60,id:\.self){i in
                    
                    Rectangle()
                        .fill(Color.primary)
                        .frame(width: 8, height: (i % 5) == 0 ? 15 : 5)
                        .offset(y: (getRect().width - 110) / 2)
                        .rotationEffect(.init(degrees: Double(i)*6))
                    
                    
                }
                
                Rectangle()
                    .fill(Color.primary)
                    .frame(width: 2, height: (getRect().width - 180) / 2)
                    .offset(y: -(getRect().width - 180) / 4)
                    .rotationEffect(.init(degrees: Double(currentTime.sec) * 6))
                
                Rectangle()
                    .fill(Color.primary)
                    .frame(width: 4, height: (getRect().width - 200) / 2)
                    .offset(y: -(getRect().width - 200) / 4)
                    .rotationEffect(.init(degrees: Double(currentTime.min) * 6))
                
                
                Rectangle()
                    .fill(Color.primary)
                    .frame(width: 4.5, height: (getRect().width - 240) / 2)
                    .offset(y: -(getRect().width - 240) / 4)
                    .rotationEffect(.init(degrees: (Double(currentTime.hour) + (Double(currentTime.min) / 60)) * 30))
                
                Circle()
                    .fill(Color.primary)
                    .frame(width: 15, height: 15)
                
                
                
            
                
            }
            .frame(width: getRect().width - 80, height: getRect().width - 80)
            .padding()
            
            
            
            Text(getTime())
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.orange)
            
            
            Spacer()
        }
        .onAppear(perform: {
            
            let calender = Calendar.current
            let min = calender.component(.minute, from: Date())
            let sec = calender.component(.second, from: Date())
            let hour = calender.component(.hour, from: Date())
            
            withAnimation(Animation.linear(duration: 0.3)){
                self.currentTime = Time(min: min, sec: sec, hour: hour)}
            
        })
        .onReceive(reciVer, perform: { _ in
            let calender = Calendar.current
            let min = calender.component(.minute, from: Date())
            let sec = calender.component(.second, from: Date())
            let hour = calender.component(.hour, from: Date())
            
            withAnimation(Animation.linear(duration: 0.3)){
                self.currentTime = Time(min: min, sec: sec, hour: hour)
            }
        })
        .preferredColorScheme(dark ? .dark : .light)
        
    }
    
    func getTime() ->String{
        
        
        let format = DateFormatter()
        format.dateFormat = "yyy/HH:mm:ssa "
        return format.string(from: Date())
        
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}

struct Time {
    var min : Int
    var sec : Int
    var hour : Int
}
