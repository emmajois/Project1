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
    let widthPassed: CGFloat
    let heightPassed: CGFloat
    
    var dynamicRange: Range<Int>{
        return 0..<iterator
    }
    
    var body: some View {
        VStack {
            ForEach(dynamicRange, id: \.self) { _ in
                ZStack {
                    Pill()
                        .opacity(shapeFill)
                    Pill().stroke(lineWidth: Constants.lineWidth)
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

struct Pill: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = Constants.drawingWidth
        let height = Constants.drawingHeight
        
        path.move(to: CGPoint(x: 0.30915*width, y: 0.29432*height))
        path.addLine(to: CGPoint(x: 0.74974*width, y: 0.29432*height))
        path.addCurve(to: CGPoint(x: 0.87145*width, y: 0.40189*height), control1: CGPoint(x: 0.81717*width, y: 0.29432*height), control2: CGPoint(x: 0.87145*width, y: 0.3423*height))
        path.addCurve(to: CGPoint(x: 0.74974*width, y: 0.50947*height), control1: CGPoint(x: 0.87145*width, y: 0.46149*height), control2: CGPoint(x: 0.81717*width, y: 0.50947*height))
        path.addLine(to: CGPoint(x: 0.30915*width, y: 0.50947*height))
        path.addCurve(to: CGPoint(x: 0.18744*width, y: 0.40189*height), control1: CGPoint(x: 0.24172*width, y: 0.50947*height), control2: CGPoint(x: 0.18744*width, y: 0.46149*height))
        path.addCurve(to: CGPoint(x: 0.30915*width, y: 0.29432*height), control1: CGPoint(x: 0.18744*width, y: 0.3423*height), control2: CGPoint(x: 0.24172*width, y: 0.29432*height))
        path.closeSubpath()
        
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
    
    //MARK: - Drawing Constants
    private struct Constants {
        static let drawingWidth = 4.0
        static let drawingHeight = 6.0
    }
}

#Preview {
    PillShapeView(shapeColor: .green, shapeFill: 0.25, iterator: 3, widthPassed: 400.0, heightPassed: 600.0)
}
