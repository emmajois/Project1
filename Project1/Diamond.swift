//
//  Diamond.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import SwiftUI

struct DiamondShape: View {
    var body: some View {
        VStack {
   
                ZStack {
                    Diamond()
                        .opacity(0.25)
                    Diamond().stroke(lineWidth: 8)
                }
                .aspectRatio(1/2, contentMode: .fit)
            
            .rotationEffect(Angle(degrees: 180))
        }
        .foregroundStyle(.purple)
//        .background(.pink)
        .padding()
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        
        Path() { p in
            p.move(to: CGPoint(x: rect.midX, y: rect.minY))
            p.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            p.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            p.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            p.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            p.closeSubpath()
        }
    }
}

#Preview {
    DiamondShape()
}
