//
//  CustomCorner.swift
//  UI-157
//
//  Created by にゃんにゃん丸 on 2021/04/04.
//

import SwiftUI

struct CustomCorner: Shape {
    var corner : UIRectCorner
    var size : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: size, height: size))
        
        return Path(path.cgPath)
    }
}

