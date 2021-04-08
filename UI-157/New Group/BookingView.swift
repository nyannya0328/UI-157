//
//  BookingView.swift
//  UI-157
//
//  Created by にゃんにゃん丸 on 2021/04/03.
//

import SwiftUI

struct BookingView: View {
    @Environment(\.presentationMode) var present
    
    @State var bookedSeat : [Int] = [3,25,35,40,60]
    @State var selectedSeat : [Int] = []
    
    @State var date : Date = Date()
    
    @State var selectedTime = "9:00"
    
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            HStack{
                
                Text("Select Seat")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .foregroundColor(.white)
            .padding()
            
            GeometryReader{reader in
                
                let width = reader.frame(in: .global).width
                
                Path{ path in
                    path.move(to: CGPoint(x: 0, y: 50))
                    path.addCurve(to: CGPoint(x: width, y: 50), control1: CGPoint(x: width / 2, y: 0), control2: CGPoint(x: width / 2, y: 0))
                    
                    
                    
                }
                .stroke(Color.gray,lineWidth:2)
              
            
                
            }
            .frame(height: 50)
            .padding(.top,20)
            .padding(.horizontal,35)
            
            let totalSheat = 60 + 4
            let leftSide = 0..<totalSheat / 2
            let rigthSide = totalSheat / 2..<totalSheat
            
            HStack(spacing:20){
                
                
                let columns = Array(repeating: GridItem(.flexible(),spacing: 10), count: 4)
                
                LazyVGrid(columns: columns,spacing: 15, content: {
                    
                    
                    ForEach(leftSide,id:\.self){index in
                        
                        let seat = index >= 29 ? index - 1 : index
                        
                        
                        SeatView(bookedSeat: $bookedSeat, selectedSeat: $selectedSeat, index: index, seat: seat)
                        
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if selectedSeat.contains(seat){
                                    
                                    selectedSeat.removeAll { (removeseat) -> Bool in
                                        return removeseat == seat
                                    }
                                    return
                                }
                                selectedSeat.append(seat)
                            }
                            .disabled(bookedSeat.contains(seat))
                        
                        
                    }
                    
                })
                
                LazyVGrid(columns: columns,spacing: 15, content: {
                    
                    
                    ForEach(rigthSide,id:\.self){index in
                        
                        let seat = index >= 35 ? index - 2 : index - 1
                        
                        SeatView(bookedSeat: $bookedSeat, selectedSeat: $selectedSeat, index: index, seat: seat)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if selectedSeat.contains(seat){
                                    
                                    selectedSeat.removeAll { (removeseat) -> Bool in
                                        return removeseat == seat
                                    }
                                    return
                                }
                                selectedSeat.append(seat)
                            }
                            .disabled(bookedSeat.contains(seat))
                        
                        
                        
                        
                    }
                    
                })
                
            }
            .padding()
            .padding(.top,30)
            
            
            HStack(spacing:15){
                
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.gray)
                    .frame(width: 20, height: 20)
                    .overlay(
                    
                    Image(systemName: "xmark")
                        .font(.caption)
                        .foregroundColor(.gray)
                        
                    )
                Text("Booked Seats")
                    .font(.caption)
                    .foregroundColor(.white)
                
                
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.green)
                    .frame(width: 20, height: 20)
                   
                Text("Avaiable")
                    .font(.caption)
                    .foregroundColor(.white)
                
                
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.green)
                    .frame(width: 20, height: 20)
                  
                Text("Booked Seats")
                    .font(.caption)
                    .foregroundColor(.white)
                
            }
            .padding(.top,25)
            
            HStack{
                
                
                Text("Date :")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                DatePicker("", selection: $date, displayedComponents: .date)
                    .labelsHidden()
            }
            .padding()
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing:15){
                    
                    ForEach(time,id:\.self){timing in
                        
                       Text(timing)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .padding(.horizontal,20)
                        .background(
                            Color.blue.opacity(selectedTime == timing ? 1 : 0)
                        
                        )
                        .cornerRadius(10)
                        .onTapGesture {
                            selectedTime = timing
                        }
                        
                        
                    }
                }
                .padding(.horizontal)
                
               
                
            }
            
            HStack(spacing:15){
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("\(selectedSeat.count)seats")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("\(selectedSeat.count * 1500)円")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                    
                    
                }
                .frame(width: 100)
                
                
                Button(action: {
                    
                    present.wrappedValue.dismiss()
                    
                }) {
                    
                    Text("By Ticket")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding(.top,20)
            .padding(.bottom,15)
            
            
            
        }
        .background(Color.primary.ignoresSafeArea())
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
        
        
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}


struct SeatView : View {
    @Binding var bookedSeat : [Int]
    @Binding var selectedSeat : [Int]
    var index : Int
    var seat : Int
    var body: some View{
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 6)
                .stroke(bookedSeat.contains(seat) ? Color.gray : Color.green,lineWidth: 2)
                .frame(height: 30)
                .background(
                    selectedSeat.contains(seat) ? Color.green : Color.clear
                
                )
                .opacity(index == 0 || index == 28 || index == 35 || index == 63 ? 0 : 1)
            
            if bookedSeat.contains(seat){
                
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
                
                    
            }
        }
        
    }
}
