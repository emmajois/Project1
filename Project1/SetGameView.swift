//
//  ContentView.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import SwiftUI

struct SetGameView: View {
    
    let setGame: SetGame
    
    var body: some View {
        HStack {
            ForEach(setGame.cards) {card in
                ZStack {
                        RoundedRectangle(cornerRadius: 10).fill(.white)
                        RoundedRectangle(cornerRadius: 10).stroke()
                        RoundedRectangle(cornerRadius: 10)
                    
                }
                .foregroundStyle(.mint)
            }
        }
        .padding()
    }
}

#Preview {
    SetGameView(setGame: SetGame())
}
