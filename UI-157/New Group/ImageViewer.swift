//
//  ImageViewer.swift
//  UI-157
//
//  Created by にゃんにゃん丸 on 2021/04/06.
//

import SwiftUI

struct ImageViewer: View {
    @EnvironmentObject var mutilVM : MultiViewModel
    
    @GestureState var draggingoffset : CGSize = .zero
    var body: some View {
        ZStack{
            
           
            
            ScrollView(.init()){
                
                TabView(selection:$mutilVM.selectedImageId){
                    

                    ForEach(mutilVM.allImages,id:\.self){image in

                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tag(image)
                            .scaleEffect(mutilVM.selectedImageId == image ? (mutilVM.imageScale > 1 ? mutilVM.imageScale : 1) : 1)
                            .offset(y: mutilVM.imageViewoffset.height)
                            .gesture(MagnificationGesture().onChanged({ (value) in
                                mutilVM.imageScale = value
                            }).onEnded({ (_) in
                                withAnimation(.spring()){
                                    
                                    
                                    mutilVM.imageScale = 1
                                }
                            })
                            .simultaneously(with: TapGesture(count: 2).onEnded({
                                
                                withAnimation{
                                    
                                    
                                    mutilVM.imageScale = mutilVM.imageScale > 1 ? 1 : 6
                                }
                            
                            }))
                            
                            
                            )
                        
                            
                    }

                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .overlay(
                
                    Button(action: {
                        
                        withAnimation(.default){
                            
                            
                            mutilVM.showImageViewer.toggle()
                        }
                        
                    }, label: {
                        
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.5))
                            .clipShape(Circle())
                        
                    })
                    .padding(10)
                    .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .opacity(mutilVM.bgopcity)
                    ,alignment: .topTrailing
                )
            }
            .ignoresSafeArea()
           
            
        }
        .gesture(DragGesture().updating($draggingoffset, body: { (value, outValue, _) in
            
            outValue = value.translation
            mutilVM.onChanged(value: draggingoffset)
        }).onEnded({ (value) in
            
            mutilVM.onEnded(value: value)
            
        }))
        .transition(.move(edge: .bottom))
       
        
    }
}

struct ImageViewer_Previews: PreviewProvider {
    static var previews: some View {
        ImageViewer()
    }
}
