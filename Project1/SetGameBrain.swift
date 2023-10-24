//
//  SetGameBrain.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import Foundation

struct SetGameBrain {
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
        
//        for (index,var card) in cards.prefix(12).enumerated() {
//            card.isOnBoard = true
//            cards[index] = card
//            deckSize-=1
//        }
    }
    
    //MARK: - functions
    
    mutating func choose(card: Card){
        if let chosenIndex = cards.firstIndex(matching: card) {
            //less than 3 are selected
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
            
            //all 3 are selected
            if selectedCards.count == 3 {
                //check if they already lost
                if let removeIndex = cards.firstIndex(matching: selectedCards[0]){
                    if cards[removeIndex].isLoser == true {
                        for loser in selectedCards {
                            if let loserIndex = cards.firstIndex(matching: loser) {
                                cards[loserIndex].isSelected = false
                                cards[loserIndex].isLoser = false
                            }
                        }
                        selectedCards = []
                        //select the card and append it to the cleared selected cards array
                        cards[chosenIndex].isSelected.toggle()
                        if cards[chosenIndex].isSelected {
                            selectedCards.append(cards[chosenIndex])
                        }
                    }
                    //check if they already won
                    else if cards[removeIndex].isMatched == true {
                        for winner in selectedCards {
                            if let winnerIndex = cards.firstIndex(matching: winner) {
                                cards[winnerIndex].isOnBoard = false
                            }
                        }
                        selectedCards = []
                        //select the card and append it to the cleared selected cards array
                        cards[chosenIndex].isSelected.toggle()
                        if cards[chosenIndex].isSelected {
                            selectedCards.append(cards[chosenIndex])
                        }
                        threeNewCards()
                    }
                    //check for a winner
                    else if checkWinner() {
                        for winner in selectedCards {
                            if let winnerIndex = cards.firstIndex(matching: winner) {
                                cards[winnerIndex].isMatched = true
                            }
                        }
                    } //they must have lost
                    else {
                        for loser in selectedCards {
                            if let loserIndex = cards.firstIndex(matching: loser) {
                                cards[loserIndex].isLoser = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    mutating func startGame() -> [Card] {
        for (index,var card) in cards.prefix(12).enumerated() {
            card.isOnBoard = true
            cards[index] = card
            deckSize-=1
            dealtCards.append(cards[index])
        }
        return dealtCards
    }
    
    mutating func threeNewCards() {
        if selectedCards.count == 3 {
            if let removeIndex = cards.firstIndex(matching: selectedCards[0]){
                if cards[removeIndex].isMatched == true {
                    for winner in selectedCards {
                        if let winnerIndex = cards.firstIndex(matching: winner) {
                            cards[winnerIndex].isOnBoard = false
                        }
                    }
                    selectedCards = []
                }
            }
        }
        
        var count = 0
        for (index, _) in cards.enumerated() {
            if count < 3 {
                if !cards[index].isOnBoard && !cards[index].isMatched {
                    cards[index].isOnBoard = true
                    count+=1
                    deckSize-=1
                }
            } else {
                break
            }
        }
    }
    
    //MARK: - Properties
    var cards: Array<Card>
    var dealtCards: Array<Card> = []
    var selectedCards: Array<Card> = []
    var deckSize: Int = 81
    
    struct Card: Identifiable {
        //MARK:- Properties within Card
        var id = UUID()
        var isSelected = false
        var isMatched = false
        var isOnBoard = false
        var isLoser = false
        
        var shape: ShapeEnum
        var color: ColorEnum
        var fill: FillEnum
        var count: Int
    }
    
    //MARK: - Private Helper Functions
    
    private func checkWinner()-> Bool{
        var shapeWinner = false
        var colorWinner = false
        var fillWinner = false
        var countWinner = false

        //check if they have a winning selection
        if selectedCards[0].shape.rawValue ==  selectedCards[1].shape.rawValue && 
            selectedCards[0].shape.rawValue == selectedCards[2].shape.rawValue {
            shapeWinner = true
        }
        else if selectedCards[0].shape.rawValue !=  selectedCards[1].shape.rawValue && 
                    selectedCards[0].shape.rawValue != selectedCards[2].shape.rawValue &&
                    selectedCards[1].shape.rawValue !=  selectedCards[2].shape.rawValue {
            shapeWinner = true
        }
        
        if selectedCards[0].color.rawValue ==  selectedCards[1].color.rawValue && 
            selectedCards[0].color.rawValue == selectedCards[2].color.rawValue {
            colorWinner = true
        }
        else if selectedCards[0].color.rawValue !=  selectedCards[1].color.rawValue && 
                    selectedCards[0].color.rawValue != selectedCards[2].color.rawValue &&
                    selectedCards[1].color.rawValue !=  selectedCards[2].color.rawValue {
            colorWinner = true
        }
        
        if selectedCards[0].fill.rawValue ==  selectedCards[1].fill.rawValue &&
            selectedCards[0].fill.rawValue == selectedCards[2].fill.rawValue {
            fillWinner = true
        }
        else if selectedCards[0].fill.rawValue !=  selectedCards[1].fill.rawValue && 
                    selectedCards[0].fill.rawValue != selectedCards[2].fill.rawValue &&
                    selectedCards[1].fill.rawValue !=  selectedCards[2].fill.rawValue {
            fillWinner = true
        }
        
        if selectedCards[0].count ==  selectedCards[1].count &&
            selectedCards[0].count == selectedCards[2].count {
            countWinner = true
        }
        else if selectedCards[0].count !=  selectedCards[1].count && 
                    selectedCards[0].count != selectedCards[2].count &&
                    selectedCards[1].count !=  selectedCards[2].count {
            countWinner = true
        }
        if shapeWinner && colorWinner && fillWinner && countWinner {
            return true
            
        } else {
            return false
        }
    }
}
