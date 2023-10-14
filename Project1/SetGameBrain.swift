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

    init(cardContentFactory: (String, String, String, Int) -> CardContent) {
        cards = []
        
        for shapeVal in ShapeEnum.allCases {
            let shapePassing: ShapeEnum = shapeVal
            for colorVal in ColorEnum.allCases {
                let colorPassing: ColorEnum = colorVal
                        for fillVal in FillEnum.allCases {
                            let fillPassing: FillEnum = fillVal
                            for count in 0..<3 {
                                let content = cardContentFactory(shapePassing.rawValue, colorPassing.rawValue, fillPassing.rawValue, count)
                                cards.append(Card(content: content))
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
        var content: CardContent
        
        
    }
}
