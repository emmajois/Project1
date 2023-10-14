//
//  SwiftUIView.swift
//  Project1
//
//  Created by IS 543 on 10/14/23.
//

//import SwiftUI
//
//struct CardView: View {
//    let card: SetGameBrain<String>.Card
//                            
//    var body: some View {
//        if card.isOnBoard {
//            GeometryReader { geometry in
//                ZStack {
//                    RoundedRectangle(cornerRadius: Card.cornerRadius).fill(.white)
//                    RoundedRectangle(cornerRadius: Card.cornerRadius).stroke()
//                    switch card.shape {
//                    case .diamond : DiamondShape(shapeColor: getColor(),
//                                                 shapeFill: getFill(),
//                                                 iterator: card.count)
//                    case .pill: PillShape(shapeColor: getColor(),
//                                          shapeFill: getFill(),
//                                          iterator: card.count)
//                    case .squiggle: SquiggleShape(shapeColor: getColor(),
//                                                  shapeFill: getFill(),
//                                                  iterator: card.count)
//                    }
//                    if card.isSelected {
//                        RoundedRectangle(cornerRadius: Card.cornerRadius).stroke(Color.yellow, lineWidth: 5)
//                    }
//                }
//                .foregroundStyle(.mint)
//            }
//            .aspectRatio(Card.aspectRatio, contentMode: .fit)
//        }
//    }
//    
//    func getColor() -> Color {
//        let shapeColor : Color
//        
//        switch card.color {
//            case .red : shapeColor = .red
//            case .purple : shapeColor = .purple
//            case .green : shapeColor = .green
//        }
//        return shapeColor
//    }
//    
//    func getFill() -> Double {
//        let shapeFill: Double
//        
//        switch card.fill {
//            case .full : shapeFill = 1.0
//            case .half : shapeFill = 0.25
//            case .empty : shapeFill = 0.0
//        }
//        return shapeFill
//    }
//    
//    //MARK: - Drawing Constants
//    private struct Card {
//        static let aspectRatio = 2.0/3.0
//        static let cornerRadius = 10.0
//        static let scaleFactor = 0.75
//    }
//}
//
//#Preview {
//    let setCard: SetGameBrain<String>.Card = {
//        var id = UUID()
//        var isSelected = false
//        var isMatched = false
//        var isOnBoard = false
//        var shape = SetGameBrain<String>.ShapeEnum.diamond
//        var color = SetGameBrain<String>.ColorEnum.red
//        var fill = SetGameBrain<String>.FillEnum.full
//        var count = 1
//    }()
//    CardView(card: setCard)
//}
