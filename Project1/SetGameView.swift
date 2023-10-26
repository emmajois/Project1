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
                LazyVGrid (columns: columns(for: geometry.size, cardCount: setGame.cards.count), spacing: Constants.spacing) {
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
    private func columns(for size: CGSize, cardCount: Int) -> [GridItem] {
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
            cardHeight = (3 * cardWidth) / 2
            rows = ceil(Double(cardCount) / columnCount)
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

extension View {
    var randomOffScreenLocation: CGSize {
        let radius = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height) * 1.5
        let factor: CGFloat = Double(Int.random(in: 1...360))
        
        return CGSize(width: radius * cos(factor), height: radius * sin(factor))
    }
}
