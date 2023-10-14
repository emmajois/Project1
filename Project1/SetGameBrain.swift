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
        
        for (index,var card) in cards.prefix(12).enumerated() {
            card.isOnBoard = true
            cards[index] = card
        }
    }
    
    //MARK: - functions
    mutating func choose(card: Card){
        if let chosenIndex = cards.firstIndex(matching: card) {
            if selectedCards.count < 3 {
                cards[chosenIndex].isSelected.toggle()
                if cards[chosenIndex].isSelected {
                    selectedCards.append(cards[chosenIndex])
                } else {
                    if let removeIndex = selectedCards.firstIndex(matching: card){
                        selectedCards.remove(at: removeIndex)
                    }
                }
            }
            
            if selectedCards.count == 3 {
                var shapeWinner = false
                var colorWinner = false
                var fillWinner = false
                var countWinner = false
                //check if they have a winning selection
                if selectedCards[0].shape.rawValue ==  selectedCards[1].shape.rawValue && selectedCards[0].shape.rawValue == selectedCards[2].shape.rawValue {
                    print("shape winner")
                    shapeWinner = true
                }
                else if selectedCards[0].shape.rawValue !=  selectedCards[1].shape.rawValue && selectedCards[0].shape.rawValue != selectedCards[2].shape.rawValue && selectedCards[1].shape.rawValue !=  selectedCards[2].shape.rawValue {
                    print("Unique shape winner")
                    shapeWinner = true
                }
                
                if selectedCards[0].color.rawValue ==  selectedCards[1].color.rawValue && selectedCards[0].color.rawValue == selectedCards[2].color.rawValue {
                    print("color winner")
                    colorWinner = true
                }
                else if selectedCards[0].color.rawValue !=  selectedCards[1].color.rawValue && selectedCards[0].color.rawValue != selectedCards[2].color.rawValue && selectedCards[1].color.rawValue !=  selectedCards[2].color.rawValue {
                    print("Unique color winner")
                    colorWinner = true
                }
                
                if selectedCards[0].fill.rawValue ==  selectedCards[1].fill.rawValue && selectedCards[0].fill.rawValue == selectedCards[2].fill.rawValue {
                    print("fill winner")
                    fillWinner = true
                }
                else if selectedCards[0].fill.rawValue !=  selectedCards[1].fill.rawValue && selectedCards[0].fill.rawValue != selectedCards[2].fill.rawValue && selectedCards[1].fill.rawValue !=  selectedCards[2].fill.rawValue {
                    print("Unique fill winner")
                    fillWinner = true
                }
                
                if selectedCards[0].count ==  selectedCards[1].count && selectedCards[0].count == selectedCards[2].count {
                    print("count winner")
                    countWinner = true
                }
                else if selectedCards[0].count !=  selectedCards[1].count && selectedCards[0].count != selectedCards[2].count && selectedCards[1].count !=  selectedCards[2].count {
                    print("Unique count winner")
                    countWinner = true
                }
                if shapeWinner && colorWinner && fillWinner && countWinner {
                    print ("You WIN TOTALLY")
                } else {
                    print ("YOU LOSE")
                }
            }
        }
    }
    
//    mutating func startGame() {
//        
//    }
//    func createCard() -> Card {
//        return Card(shape: ShapeEnum.diamond,
//                    color: ColorEnum.red,
//                    fill: FillEnum.empty,
//                    count: 1)
//    }
    //MARK: - Properties
    var cards: Array<Card>
    var selectedCards: Array<Card> = []
    
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
