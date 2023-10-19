//
//  Pill.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import SwiftUI

struct PillShapeView: View {
    
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
                    Pill()
                        .opacity(shapeFill)
                    Pill().stroke(lineWidth: 6)
                }
                .aspectRatio(1/2, contentMode: .fit)
            }
        }
        .foregroundStyle(Color(shapeColor))
        //.background(.pink)
    }
}

struct Pill: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.30915*width, y: 0.29432*height))
        path.addLine(to: CGPoint(x: 0.74974*width, y: 0.29432*height))
        path.addCurve(to: CGPoint(x: 0.87145*width, y: 0.40189*height), control1: CGPoint(x: 0.81717*width, y: 0.29432*height), control2: CGPoint(x: 0.87145*width, y: 0.3423*height))
        path.addCurve(to: CGPoint(x: 0.74974*width, y: 0.50947*height), control1: CGPoint(x: 0.87145*width, y: 0.46149*height), control2: CGPoint(x: 0.81717*width, y: 0.50947*height))
        path.addLine(to: CGPoint(x: 0.30915*width, y: 0.50947*height))
        path.addCurve(to: CGPoint(x: 0.18744*width, y: 0.40189*height), control1: CGPoint(x: 0.24172*width, y: 0.50947*height), control2: CGPoint(x: 0.18744*width, y: 0.46149*height))
        path.addCurve(to: CGPoint(x: 0.30915*width, y: 0.29432*height), control1: CGPoint(x: 0.18744*width, y: 0.3423*height), control2: CGPoint(x: 0.24172*width, y: 0.29432*height))
        path.closeSubpath()
        return path
    }
}

#Preview {
    PillShapeView(shapeColor: .red, shapeFill: 0.25, iterator: 3)
}
