//
//  SetGameBrain.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import Foundation

struct SetGameBrain<CardContent> {
    //MARK: - Initiation
    init() {
        cards = []
        
        for shapeVal in ShapeEnum.allCases {
            let shapePassing: ShapeEnum = shapeVal
            for colorVal in ColorEnum.allCases {
                let colorPassing: ColorEnum = colorVal
                        for fillVal in FillEnum.allCases {
                            let fillPassing: FillEnum = fillVal
                            for count in 0..<3 {
                                let tempCard = Card(shape: shapePassing, color: colorPassing, fill: fillPassing, count: count+1 )
                                cards.append(tempCard)
                    }
                }
            }
        }
        cards.shuffle()
        
        for (index,var card) in cards.prefix(1).enumerated() {
            card.isOnBoard = true
            cards[index] = card
        }
    }
    
    //MARK: - functions
    mutating func choose(card: Card){
        print("You chose \(card)")
        
        if let index = cards.firstIndex(matching: card) {
            cards[index].isSelected.toggle()
        }
    }
    
//    mutating func startGame() {
//        
//    }
    
    //MARK: - Properties
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
    
    struct Card: Identifiable {
        //MARK:- Properties within Card
        var id = UUID()
        var isSelected = false
        var isMatched = false
        var isOnBoard = false
        
        var shape: ShapeEnum
        var color: ColorEnum
        var fill: FillEnum
        var count: Int
        
        
        
    }
}
