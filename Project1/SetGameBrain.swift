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

    init(){
        cards = []
        
        var contentData: [(ShapeEnum, ColorEnum, FillEnum, Int)] = []
        
        for shapeVal in ShapeEnum.allCases {
            for colorVal in ColorEnum.allCases {
                        for fillVal in FillEnum.allCases {
                            for count in 0..<3 {
                                contentData.append((shapeVal, colorVal, fillVal, count))
                    }
                }
            }
        }
    }
    
    func choose(card: Card){
        print("You chose \(card)")
    }
    
    struct Card {
        //MARK:- Properties
        var isSelected = false
        var isMatched = false
        var content: CardContent
        
        
    }
}
