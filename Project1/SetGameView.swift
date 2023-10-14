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
                //getElements(card: card)
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
                RoundedRectangle(cornerRadius: Card.cornerRadius).fill(.white)
                RoundedRectangle(cornerRadius: Card.cornerRadius).stroke()
                    switch card.shape {
                        case .diamond : DiamondShape(shapeColor: getColor(), shapeFill: getFill(), iterator: card.count)
                        case .pill: PillShape(shapeColor: getColor(), shapeFill: getFill(), iterator: card.count)
                        case .squiggle: SquiggleShape(shapeColor: getColor(), shapeFill: getFill(), iterator: card.count)
                    }
                if card.isSelected {
                    RoundedRectangle(cornerRadius: Card.cornerRadius).stroke(Color.yellow, lineWidth: 5)
                }
            }
        }
        .foregroundStyle(.mint)
        .aspectRatio(Card.aspectRatio, contentMode: .fit)
    }
    
    func getColor() -> Color {
        let shapeColor : Color
        
        switch card.color {
            case .red : shapeColor = .red
            case .purple : shapeColor = .purple
            case .green : shapeColor = .green
        }
        return shapeColor
    }
    
    func getFill() -> Double {
        let shapeFill: Double
        
        switch card.fill {
            case .full : shapeFill = 1.0
            case .half : shapeFill = 0.25
            case .empty : shapeFill = 0.0
        }
        return shapeFill
    }
    
//    func getShape() -> any View {
//        let shapeShape : any View
//            
//        switch card.shape {
//        case .diamond : shapeShape = DiamondShape()
//        case .pill: shapeShape = PillShape()
//        case .squiggle: shapeShape = SquiggleShape(shapeColor: .red, shapeFill: 0.25)
//        }
//        return shapeShape
//    }
    
    //MARK: - Drawing Constants
    private struct Card {
        static let aspectRatio = 2.0/3.0
        static let cornerRadius = 10.0
    }
}

#Preview {
    SetGameView(setGame: SetGame())
}
