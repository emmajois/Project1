//
//  SwiftUIView.swift
//  Project1
//
//  Created by IS 543 on 10/14/23.
//

import SwiftUI

struct CardView: View {
    
    let card: SetGameBrain.Card
    
        var body: some View {
                GeometryReader { geometry in
                    ZStack {
                        RoundedRectangle(cornerRadius: Card.cornerRadius).fill(.white)
                        RoundedRectangle(cornerRadius: Card.cornerRadius).stroke()
                        switch card.shape {
                        case .diamond : DiamondShapeView(shapeColor: getColor(),
                                                     shapeFill: getFill(),
                                                     iterator: card.count,
                                                     widthPassed: geometry.size.width,
                                                     heightPassed: geometry.size.height)
                        case .pill: PillShapeView(shapeColor: getColor(),
                                              shapeFill: getFill(),
                                              iterator: card.count,
                                              widthPassed: geometry.size.width,
                                              heightPassed:geometry.size.height)
                        case .squiggle: SquiggleShapeView(shapeColor: getColor(),
                                                      shapeFill: getFill(),
                                                      iterator: card.count,
                                                      widthPassed: geometry.size.width,
                                                      heightPassed: geometry.size.height)
                        }
                        if card.isSelected {
                            RoundedRectangle(cornerRadius: Card.cornerRadius).stroke(Color.yellow, lineWidth: 5)
                        } 
                        if card.isMatched {
                            RoundedRectangle(cornerRadius: Card.cornerRadius).stroke(Color.green, lineWidth: 5)
                        }
                        if card.isLoser && card.isSelected {
                            RoundedRectangle(cornerRadius: Card.cornerRadius).stroke(Color.red, lineWidth: 5)
                        }
                    }
                    .foregroundStyle(.black)
                    .transition(AnyTransition.offset(randomOffScreenLocation))
                }
                .aspectRatio(Card.aspectRatio, contentMode: .fit)
            }
    
//    private var randomOffScreenLocation: CGSize {
//        let radius = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height) * 1.5
//        let factor: CGFloat = Double(Int.random(in: 1...360))
//        
//        return CGSize(width: radius * cos(factor), height: radius * sin(factor))
//    }
    
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
        
        //MARK: - Drawing Constants
        private struct Card {
            static let aspectRatio = 2.0/3.0
            static let cornerRadius = 10.0
            static let scaleFactor = 0.75
        }
    }

#Preview {
    CardView(card: SetGameBrain.Card(isOnBoard: true, shape: .diamond, color: .green, fill: .full, count: 1))
        .padding(50)
}
