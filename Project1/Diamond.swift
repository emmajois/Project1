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
                        .stroke(lineWidth: Constants.lineWidth)
                }
            }
        }
        .foregroundStyle(shapeColor)
        .frame(width:widthPassed*Constants.shrinkValue, height:heightPassed*Constants.shrinkValue)
    }
    //MARK: - Drawing Constants
    private struct Constants {
        static let shrinkValue = 0.5
        static let lineWidth = 3.0
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = Constants.drawingWidth
        let height = Constants.drawingHeight
        
        path.move(to: CGPoint(x: 0.02*width, y: 0.04167*height))
        path.addLine(to: CGPoint(x: 0.04167*width, y: 0.01167*height))
        path.addLine(to: CGPoint(x: 0.06333*width, y: 0.04167*height))
        path.addLine(to: CGPoint(x: 0.04167*width, y: 0.07167*height))
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
        static let drawingWidth = 3.0
        static let drawingHeight = 1.0
    }
}

#Preview {
    DiamondShapeView(shapeColor: .green, shapeFill: 0.25, iterator: 3, widthPassed: 400.0, heightPassed: 600.0)
}
