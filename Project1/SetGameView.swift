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
                LazyVGrid (columns: columns(for: geometry.size), spacing: Constants.spacing) {
                    ForEach(setGame.cards) {card in
                        CardView(card: card)
                            .transition(AnyTransition.offset(randomOffScreenLocation))
                            .onTapGesture {
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
        .onAppear {
                setGame.startGame()
        }
    }
    
    
    
    //MARK: - Helper Functions
    private func columns(for size: CGSize) -> [GridItem] {
        var fits = false
        let screenHeight = Double(size.height)
        let screenWidth = Double(size.width)
        var cardWidth: Double
        var cardHeight: Double
        var rows: Double
        var calculatedHeight: Double
        
        var columnCount = 3.0
        while !fits {
            cardWidth = (screenWidth - (columnCount - 1) * Constants.spacing) / columnCount
            cardHeight = (7 * cardWidth) / 5
            rows = ceil(Double(setGame.cards.count) / columnCount)
            calculatedHeight = rows * cardHeight + (rows - 1.0) * Constants.spacing
            if calculatedHeight <= screenHeight {
                fits = true
            } else {
                columnCount+=1.0
            }
        }
        
        return Array(repeating: GridItem(.flexible(), spacing: Constants.spacing), count: Int(columnCount))
    }
    
    //MARK: - Drawing Constants
    private struct Constants {
        static let spacing = 5.0
    }
}

#Preview {
    SetGameView(setGame: SetGame())
}
