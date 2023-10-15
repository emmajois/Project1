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
        GeometryReader { geometry in
            LazyVGrid (columns: columns(for: geometry.size)) {
                ForEach(setGame.cards) {card in
                    CardView(card: card)
                        .onTapGesture{
                            setGame.choose(card)
                        }
                }
            }
            .padding()
        }
    }
    
    private func columns(for size: CGSize) -> [GridItem] {
        Array(repeating: GridItem(.flexible()), count: Int(size.width / 125))
    }
}

#Preview {
    SetGameView(setGame: SetGame())
}
