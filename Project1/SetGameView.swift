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
            VStack{
                LazyVGrid (columns: columns(for: geometry.size, cardCount: howManyOnBoard(cardsPassed: setGame.cards))) {
                    ForEach(setGame.cards) {card in
                        CardView(card: card)
                            .onTapGesture{
                                setGame.choose(card)
                            }
                    }
                }
                Spacer()
                HStack {
                    Button("New Game") {
                        setGame.newGame()
                    }
                    Spacer()
                    Button("3 More Cards") {
                        setGame.addMoreCards()
                    }
                    .disabled(setGame.deckSize < 1)
                }
            }
            .padding()
        }
    }
    
    //MARK: - Helper Functions
    private func columns(for size: CGSize, cardCount: Int) -> [GridItem] {
        if cardCount < 13 {
            return Array(repeating: GridItem(.flexible()), count: 3)
        } else if cardCount < 21 {
           return Array(repeating: GridItem(.flexible()), count: 4)
        } else if cardCount < 31 {
           return Array(repeating: GridItem(.flexible()), count: 5)
        } else if cardCount < 49 {
           return Array(repeating: GridItem(.flexible()), count: 6)
        } else if cardCount < 64 {
            return Array(repeating: GridItem(.flexible()), count: 7)
        } else {
           return Array(repeating: GridItem(.flexible()), count: 8)
        }
    }
    
    private func howManyOnBoard(cardsPassed: [SetGameBrain.Card]) -> Int {
        var count = 0
        for card in setGame.cards {
            if card.isOnBoard {
                count+=1
            }
        }
        return count
    }
}

#Preview {
    SetGameView(setGame: SetGame())
}
