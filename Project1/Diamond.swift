//
//  Diamond.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import SwiftUI

struct DiamondShapeView: View {
    
    let shapeColor: Color
    let shapeFill: Double
    let iterator: Int
    let widthPassed: CGFloat
    let heightPassed: CGFloat
    let shrinkValue = 0.5
    
    var dynamicRange: Range<Int>{
        return 0..<iterator
    }
    
    var body: some View {
        VStack {
            ForEach(dynamicRange, id: \.self) { _ in
                ZStack {
                    Diamond()
                        .opacity(shapeFill)
                    Diamond()
                        .stroke(lineWidth: 3)
                }
                //.aspectRatio(1/2, contentMode: .fit)
            }
            //.rotationEffect(Angle(degrees: 90))
        }
        .foregroundStyle(shapeColor)
        .frame(width:widthPassed*shrinkValue, height:heightPassed*shrinkValue)
        .background(.pink)
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
    DiamondShapeView(shapeColor: .green, shapeFill: 0.25, iterator: 1, widthPassed: 400.0, heightPassed: 600.0)
}
//path = path.offsetBy(
//    dx: rect.minX - path.boundingRect.minX,
//    dy: rect.minY - path.boundingRect.minY - path.boundingRect.midY
//    )
//
//let scale = rect.width / path.boundingRect.width
//let transform = CGAffineTransform(scaleX: scale, y: scale)
//
//path = path.applying(transform)
//
//path = path.offsetBy(
//    dx: 0,
//    dy: rect.midY - path.boundingRect.midY)
