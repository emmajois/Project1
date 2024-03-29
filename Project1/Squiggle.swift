//
//  Squiggle.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import SwiftUI

struct SquiggleShapeView: View {
    
    let shapeColor: Color
    let shapeFill: Double
    let iterator: Int
    let widthPassed: CGFloat
    let heightPassed: CGFloat
    
    var dynamicRange: Range<Int>{
        return 0..<iterator
    }
    
    var body: some View {
            VStack {
                    ForEach(dynamicRange, id: \.self) { _ in
                    ZStack {
                        Squiggle(Iterator: iterator)
                            .opacity(shapeFill)
                        
                        Squiggle(Iterator: iterator)
                            .stroke(lineWidth: Constants.lineWidth)
                    }
                }
            }
        .foregroundStyle(Color(shapeColor))
        .frame(width:widthPassed*Constants.shrinkValue, height:heightPassed*Constants.shrinkValue)
    }
    
    //MARK: - Drawing Constants
    private struct Constants {
        static let shrinkValue = 0.5
        static let lineWidth = 3.0
    }
}

let segments = [
    (CGPoint(x: 630, y: 540),  CGPoint(x: 1124, y: 369), CGPoint(x: 897, y: 608)),
    (CGPoint(x: 270, y: 530),  CGPoint(x: 523, y: 513),  CGPoint(x: 422, y: 420)),
    (CGPoint(x: 50, y: 400),   CGPoint(x: 96, y: 656),   CGPoint(x: 54, y: 583)),
    (CGPoint(x: 360, y: 120),  CGPoint(x: 46, y: 220),   CGPoint(x: 191, y: 97)),
    (CGPoint(x: 890, y: 140),  CGPoint(x: 592, y: 152),  CGPoint(x: 619, y: 315)),
    (CGPoint(x: 1040, y: 150), CGPoint(x: 953, y: 100),  CGPoint(x: 1009, y: 69))
]

struct Squiggle: Shape {
    let Iterator: Int;
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        guard let lastSegment = segments.last else {
            return path
        }

        path.move(to: lastSegment.0)
        segments.forEach { path.addCurve(to: $0, control1: $1, control2: $2) }

        path = path.offsetBy(
            dx: rect.minX - path.boundingRect.minX,
            dy: rect.minY - path.boundingRect.minY - path.boundingRect.midY
            )

        let scale = rect.width / path.boundingRect.width
        let transform = CGAffineTransform(scaleX: scale, y: scale)
        
        path = path.applying(transform)
        
        path = path.offsetBy(
            dx: 0,
            dy: rect.midY - path.boundingRect.midY)
        return path
    }
}

#Preview {
    SquiggleShapeView(shapeColor: .green, shapeFill: 0.25, iterator:1, widthPassed: 400.0, heightPassed: 600.0)
}
