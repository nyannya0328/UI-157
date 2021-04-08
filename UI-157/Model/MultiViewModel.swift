//
//  MultiViewModel.swift
//  UI-157
//
//  Created by にゃんにゃん丸 on 2021/04/06.
//

import SwiftUI

class MultiViewModel: ObservableObject {
    @Published var allImages : [String] = ["p1","p2","p3","p4","p5","p6"]
    @Published var showImageViewer = false
    @Published var selectedImageId : String = ""
    
    @Published var imageViewoffset : CGSize = .zero
    
    @Published var bgopcity : Double = 1
    
    @Published var imageScale : CGFloat = 1
    
    func onChanged(value : CGSize){
        
        imageViewoffset = value
        
        let halgHeight = UIScreen.main.bounds.height / 2
        let progress = imageViewoffset.height / halgHeight
        
            
            bgopcity = Double(1 - (progress < 0 ? -progress : progress))
            
      
    }
    
    func onEnded(value : DragGesture.Value){
        
        var translation = value.translation.height
        
        if translation < 0{
            
            translation = -translation
        }
        if translation < 250{
            
           
            
            
            imageViewoffset = .zero
            bgopcity = 1
        }
        else{
            
            showImageViewer.toggle()
            imageViewoffset = .zero
            bgopcity = 1
            
        }
        
        
        
    }
}


