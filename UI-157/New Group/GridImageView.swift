//
//  GridImageView.swift
//  UI-157
//
//  Created by にゃんにゃん丸 on 2021/04/06.
//

import SwiftUI

struct GridImageView: View {
    @EnvironmentObject var mutilVM : MultiViewModel
    
  
    var index : Int
    var body: some View {
        Button(action: {
            
            withAnimation(.easeInOut(duration: 0.2)){
                
                
                mutilVM.selectedImageId = mutilVM.allImages[index]
                mutilVM.showImageViewer.toggle()
            }
            
        }) {
            
            
            ZStack{
                
                if index <= 3{
                    
                    Image(mutilVM.allImages[index])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: getWidth(index: index), height: 150)
                        .cornerRadius(12)
                }
                
                
                if mutilVM.allImages.count > 4 && index == 3{
                    
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.black.opacity(0.3))
                    
                    let remaingImage = mutilVM.allImages.count - 4
                    
                    Text("+\(remaingImage)")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                }
                
            }
            
        }
    }
    func getWidth(index : Int) -> CGFloat{
        
        let width = getRect().width - 100
        
        if mutilVM.allImages.count % 2 == 0{
            
            
            return width / 2
        }
        
        else{
            
            
            if index == mutilVM.allImages.count - 1{
                
                 return width
            }
            else{
                
                return width / 2
            }
        }
        
      
       
    }
}

struct GridImageView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
