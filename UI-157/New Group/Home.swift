//
//  Home.swift
//  UI-157
//
//  Created by にゃんにゃん丸 on 2021/04/03.
//

import SwiftUI

struct Home: View {
    @State var show = false
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVStack(spacing: 15, pinnedViews: [.sectionFooters], content: {
                    Section(footer: FooterView()){
                        
                         HStack{
                             
                             
                             
                             Spacer()
                             
                             Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                 Image(systemName: "bookmark.fill")
                                     .font(.title)
                                    .foregroundColor(show ? .red : .none)
                                    .onTapGesture {
                                        show.toggle()
                                    }
                                     
                             })
                         }
                         .overlay(
                             
                             Text("Detatil View")
                                 .font(.title)
                                 
                              
                         
                         
                         )
                         .padding()
                         .foregroundColor(.white)
                         
                         ZStack{
                             
                             RoundedRectangle(cornerRadius: 15)
                                 .fill(Color.white.opacity(0.2))
                                 .padding(.horizontal)
                                 .offset(y: 12)
                             
                             Image("p1")
                                 .resizable()
                                 .aspectRatio(contentMode: .fill)
                                 
                                 .cornerRadius(15)
                         }
                         .frame(width: getRect().width / 1.5, height: getRect().height / 2)
                         .padding(.top,20)
                         
                         VStack(alignment: .leading, spacing: 15, content: {
                             Text("Disney 20🙅‍♀️🙅‍♀️年　X/X")
                                 .font(.title2)
                                 .fontWeight(.bold)
                                 .foregroundColor(.white)
                             
                             Text("Directer Carry Nessan | 5")
                                 .foregroundColor(.white)
                                 .overlay(
                                 
                                     HStack{
                                         ForEach(1...10,id:\.self){index in
                                             
                                             Image(systemName: "star.fill")
                                                 .font(.system(size: 10))
                                                 .foregroundColor(.yellow)
                                                 .offset(x: 230, y: -2)
                                         }
                                         
                                     }
                                     ,alignment: .trailing
                                 )
                             
                             LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], alignment: .leading, content: {
                                 
                                 
                                 ForEach(genle,id:\.self){gene in
                                     
                                     Text(gene)
                                         .font(.caption)
                                         .padding(.vertical,10)
                                         .frame(maxWidth: .infinity)
                                         .foregroundColor(.white)
                                         .background(Color.white.opacity(0.6))
                                         .clipShape(Capsule())
                                 }
                                
                             })
                             .padding(.top,20)
                             
                             Text("synopisis")
                                 .font(.title2)
                                 .fontWeight(.bold)
                                 .foregroundColor(.white)
                                 .padding(.vertical)
                             
                             Text(synopisis)
                                 .foregroundColor(.white)
                             
                             
                             
                         })
                         .padding(.top,55)
                         .padding(.horizontal)
                         .padding(.leading,6)
                         .frame(maxWidth: .infinity,alignment: .leading)
                         
                         
                    }
                    
                    
                })
            })
            .background(Color.primary.opacity(0.5).ignoresSafeArea())
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
           
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    func getRect() ->CGRect{
        
        return UIScreen.main.bounds
    }
}

struct FooterView : View {
    var body: some View{
        
        NavigationLink(
            destination: BookingView(),
            label: {
                
               
                    
                    
                    
                    Text("By Checket")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: getRect().width / 2)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .offset(x: 100)
                
                
                
                
               
                
            })
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: -5, y: -5)
          
    }
}
