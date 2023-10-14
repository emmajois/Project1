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
                    CardView(card: card)
                        .onTapGesture{
                            setGame.choose(card)
                        }

            }
        }
        .padding()
    }
}

struct CardView: View {
    let card: SetGameBrain<String>.Card
                            
    var body: some View {
        ZStack {
            if card.isOnBoard {
                RoundedRectangle(cornerRadius: 10).fill(.white)
                RoundedRectangle(cornerRadius: 10).stroke()
                switch card.shape {
                    case .squiggle : SquiggleShape()
                    case .diamond: DiamondShape()
                    case .pill : PillShape()
                }
            }
        }
        .foregroundStyle(.mint)
    }
}
#Preview {
    SetGameView(setGame: SetGame())
}
