//
//  CardView.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill(.white)
            RoundedRectangle(cornerRadius: 10).stroke()
        }
        .foregroundColor(.mint)
    }
}

#Preview {
    CardView()
}
