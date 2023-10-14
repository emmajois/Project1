//
//  Pill.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import SwiftUI

struct PillShape: View {
    
    let shapeColor: Color
    let shapeFill: Double
    let iterator: Int
    
    var dynamicRange: Range<Int>{
        return 0..<iterator
    }
    
    var body: some View {
        VStack{
            ForEach(dynamicRange, id: \.self) { _ in
                ZStack{
                    Capsule(style: .continuous)
                        .fill(shapeColor)
                        .opacity(shapeFill)
                        .frame(width: 220, height: 100)
                        .scaledToFit()
                    Capsule(style: .continuous)
                        .stroke(shapeColor, lineWidth:8)
                        .frame(width: 220, height: 100)
                        .scaledToFit()
                }
                .aspectRatio(1/2, contentMode: .fit)
                .padding()
            }
        }
        //.rotationEffect(Angle(degrees: 90))
        //.background(.pink)
    }
}


#Preview {
    PillShape(shapeColor: .red, shapeFill: 0.25, iterator: 3)
}
