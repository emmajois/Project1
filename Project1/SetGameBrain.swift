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
        undealtCards = []
        
        for shapeVal in ShapeEnum.allCases {
            let shapePassing: ShapeEnum = shapeVal
            for colorVal in ColorEnum.allCases {
                let colorPassing: ColorEnum = colorVal
                        for fillVal in FillEnum.allCases {
                            let fillPassing: FillEnum = fillVal
                            for count in 0..<3 {
                                let tempCard = Card(shape: shapePassing, color: colorPassing, fill: fillPassing, count: count+1 )
                                undealtCards.append(tempCard)
                    }
                }
            }
        }
        undealtCards.shuffle()
    }
    
    //MARK: - functions
    
    mutating func choose(card: Card){
        let selectedCards = dealtCards.filter {$0.isSelected && !$0.isMatched}
        if let chosenIndex = undealtCards.firstIndex(matching: card) {
            //less than 3 are selected
            if selectedCards.count < 3 {
                undealtCards[chosenIndex].isSelected.toggle()
            }
            
            //all 3 are selected
            if selectedCards.count == 3 {
                //check if they already lost
                if let removeIndex = undealtCards.firstIndex(matching: selectedCards[0]){
                    if undealtCards[removeIndex].isLoser == true {
                        for loser in selectedCards {
                            if let loserIndex = undealtCards.firstIndex(matching: loser) {
                                undealtCards[loserIndex].isSelected = false
                                undealtCards[loserIndex].isLoser = false
                            }
                        }
                        //select the card and append it to the cleared selected cards array
                        undealtCards[chosenIndex].isSelected.toggle()
                    }
                    //check if they already won
                    else if undealtCards[removeIndex].isMatched == true {
                        for winner in selectedCards {
                            if let winnerIndex = undealtCards.firstIndex(matching: winner) {
                                undealtCards[winnerIndex].isOnBoard = false
                            }
                        }
                        //select the card and append it to the cleared selected cards array
                        undealtCards[chosenIndex].isSelected.toggle()
                        threeNewCards()
                    }
                    //check for a winner
                    else if checkWinner() {
                        for winner in selectedCards {
                            if let winnerIndex = undealtCards.firstIndex(matching: winner) {
                                undealtCards[winnerIndex].isMatched = true
                            }
                        }
                    } //they must have lost
                    else {
                        for loser in selectedCards {
                            if let loserIndex = undealtCards.firstIndex(matching: loser) {
                                undealtCards[loserIndex].isLoser = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    mutating func startGame() {
        //dealtCards.append(contentsOf: )
        for (index, _) in undealtCards.prefix(12).enumerated() {
            dealtCards.append(undealtCards[index])
        }
        undealtCards.removeFirst(12)
    }
    
    mutating func threeNewCards() {
        let selectedCards = dealtCards.filter {$0.isSelected && !$0.isMatched}
        if selectedCards.count == 3 {
            if let removeIndex = undealtCards.firstIndex(matching: selectedCards[0]){
                if undealtCards[removeIndex].isMatched == true {
                    for winner in selectedCards {
                        if let winnerIndex = undealtCards.firstIndex(matching: winner) {
                            undealtCards[winnerIndex].isOnBoard = false
                        }
                    }
                }
            }
        }
        
        var count = 0
        for (index, _) in undealtCards.enumerated() {
            if count < 3 {
                if !undealtCards[index].isOnBoard && !undealtCards[index].isMatched {
                    undealtCards[index].isOnBoard = true
                    count+=1
                    deckSize-=1
                }
            } else {
                break
            }
        }
    }
    
    //MARK: - Properties
    var undealtCards: Array<Card>
    var dealtCards: Array<Card> = []
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
        let selectedCards = dealtCards.filter {$0.isSelected && !$0.isMatched}
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
