//
//  RandomLocation+View.swift
//  Project1
//
//  Created by IS 543 on 10/26/23.
//

import SwiftUI

extension View {
    var randomOffScreenLocation: CGSize {
        let radius = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height) * 1.5
        let factor: CGFloat = Double(Int.random(in: 1...360))
        
        return CGSize(width: radius * cos(factor), height: radius * sin(factor))
    }
}
