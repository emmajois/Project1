//
//  Squiggle.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import SwiftUI

struct SquiggleShape: View {
    
    let shapeColor: Color
    let shapeFill: Double
    let iterator: Int
    
    var dynamicRange: Range<Int>{
        return 0..<iterator
    }
    
    var body: some View {
        //GeometryReader { geometry in
            HStack {
            ForEach(dynamicRange, id: \.self) { _ in
                    ZStack {
                        Squiggle()
                            .opacity(shapeFill)
//                            .frame(width: min(geometry.size.width * 0.5, UIScreen.main.bounds.size.width), height: min(geometry.size.height * 0.5, UIScreen.main.bounds.size.height))
                        Squiggle()
                            .stroke(lineWidth: 6)
//                            .frame(width: min(geometry.size.width, UIScreen.main.bounds.size.width), height: min(geometry.size.height, UIScreen.main.bounds.size.height))
                    }
                    //.background(.pink)
                }
                .aspectRatio(2/3, contentMode: .fit)
            }
            .rotationEffect(Angle(degrees: 90))
       //}
        .foregroundStyle(Color(shapeColor))
        //.background(.pink)
        .padding()
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
    func path(in rect: CGRect) -> Path {
        var path = Path()

        guard let lastSegment = segments.last else {
            return path
        }

        path.move(to: lastSegment.0)
        segments.forEach { path.addCurve(to: $0, control1: $1, control2: $2) }

        path = path.offsetBy(
            dx: rect.minX - path.boundingRect.minX,
            dy: rect.minY - path.boundingRect.minY
        )

        let scale = rect.height / path.boundingRect.width
        let transform = CGAffineTransform(scaleX: scale, y: scale)
            .rotated(by: Double.pi / 2)

        path = path.applying(transform)

        return path.offsetBy(dx: rect.width, dy: 0)
    }
}

#Preview {
    SquiggleShape(shapeColor: .red, shapeFill: 0.25, iterator:3)
}
