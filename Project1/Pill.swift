//
//  Pill.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import SwiftUI

struct PillShape: View {
    var body: some View {
        ZStack{
            Capsule(style: .continuous)
                .fill(.purple)
                .opacity(0.25)
                .frame(width: 220, height: 100)
                .scaledToFit()
            Capsule(style: .continuous)
                .stroke(.purple, lineWidth:8)
                .frame(width: 220, height: 100)
                .scaledToFit()
        }
        .rotationEffect(Angle(degrees: 90))
    }
}


#Preview {
    PillShape()
}
