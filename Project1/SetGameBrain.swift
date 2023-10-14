//
//  SetGameBrain.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import Foundation

struct SetGameBrain<CardContent> {
    var cards: Array<Card>
    
    enum ShapeEnum: String, CaseIterable, Identifiable{
        case squiggle
        case diamond
        case pill
        var id: String {self.rawValue}
    }
    enum ColorEnum: String, CaseIterable, Identifiable{
        case green
        case purple
        case red
        var id: String {self.rawValue}
    }
    enum FillEnum: String, CaseIterable, Identifiable {
        case empty
        case half
        case full
        var id: String {self.rawValue}
    }

    init() {
        cards = []
        
        for shapeVal in ShapeEnum.allCases {
            let shapePassing: ShapeEnum = shapeVal
            for colorVal in ColorEnum.allCases {
                let colorPassing: ColorEnum = colorVal
                        for fillVal in FillEnum.allCases {
                            let fillPassing: FillEnum = fillVal
                            for count in 0..<3 {
                                var tempCard = Card(shape: shapePassing, color: colorPassing, fill: fillPassing, count: count+1 )
                                tempCard.shape = shapePassing
                                tempCard.color = colorPassing
                                tempCard.fill = fillPassing
                                tempCard.count = count
                                cards.append(tempCard)
                    }
                }
            }
        }
        cards.shuffle()
    }
    
    func choose(card: Card){
        print("You chose \(card)")
    }
    
    //func startGame
    struct Card: Identifiable {
        //MARK:- Properties
        var id = UUID()
        var isSelected = false
        var isMatched = false
        var isOnBoard = true
        
        //var content: CardContent
        
        var shape: ShapeEnum
        var color: ColorEnum
        var fill: FillEnum
        var count: Int
        
        
        
    }
}
