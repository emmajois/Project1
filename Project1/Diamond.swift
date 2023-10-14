//
//  Diamond.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import SwiftUI

struct DiamondShape: View {
    
    let shapeColor: Color
    let shapeFill: Double
    let iterator: Int
    
    var dynamicRange: Range<Int>{
        return 0..<iterator
    }
    
    var body: some View {
        VStack {
            ForEach(dynamicRange, id: \.self) { _ in
                ZStack {
                    Diamond()
                        .opacity(shapeFill)
                    Diamond().stroke(lineWidth: 8)
                }
                .aspectRatio(1/2, contentMode: .fit)
            }
            .rotationEffect(Angle(degrees: 90))
        }
        .foregroundStyle(shapeColor)
        //.background(.pink)
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
    DiamondShape(shapeColor: .red, shapeFill: 0.25, iterator: 3)
}
