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
        var selectedCards = dealtCards.filter{$0.isSelected}
        
        if let chosenIndex = dealtCards.firstIndex(matching: card) {
            //less than 3 are selected initially
            if selectedCards.count < 3 {
                dealtCards[chosenIndex].isSelected.toggle()
            }
            //need to recompute in case we just added another card
            selectedCards = dealtCards.filter{$0.isSelected}
            
            //all 3 are selected
            if selectedCards.count == 3 {
                //check if they already lost
                if let removeIndex = dealtCards.firstIndex(matching: selectedCards[0]){
                    if dealtCards[removeIndex].isLoser == true {
                        for loser in selectedCards {
                            if let loserIndex = dealtCards.firstIndex(matching: loser) {
                                dealtCards[loserIndex].isSelected = false
                                dealtCards[loserIndex].isLoser = false
                            }
                        }
                        //select the card and append it to the cleared selected cards array
                        dealtCards[chosenIndex].isSelected.toggle()
                    }
                    //check if they already won
                    else if dealtCards[removeIndex].isMatched == true {
                        let selectedCard = dealtCards[chosenIndex]
                        for winner in selectedCards {
                            if let winnerIndex = dealtCards.firstIndex(matching: winner) {
                                if dealtCards.count < 13 {
                                    dealtCards[winnerIndex] = undealtCards[0]
                                    undealtCards.removeFirst(1)
                                } else {
                                    dealtCards.remove(at: winnerIndex)
                                }
                            }
                        }
                        //select the new card
                        if let newIndex = dealtCards.firstIndex(matching: selectedCard){
                            dealtCards[newIndex].isSelected.toggle()
                        }
                    }
                    
                    //check for a winner
                    else if checkWinner() {
                        for winner in selectedCards {
                            if let winnerIndex = dealtCards.firstIndex(matching: winner) {
                                dealtCards[winnerIndex].isMatched = true
                            }
                        }
                    } //they must have lost
                    else {
                        for loser in selectedCards {
                            if let loserIndex = dealtCards.firstIndex(matching: loser) {
                                dealtCards[loserIndex].isLoser = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    mutating func startGame() {
        addNewCards(cardCount: 12)
    }
    
    mutating func addNewCards(cardCount: Int) {
        dealtCards.append(contentsOf: undealtCards.prefix(cardCount))
        undealtCards.removeFirst(cardCount)
    }
    
    //MARK: - Properties
    var undealtCards: Array<Card>
    var dealtCards: Array<Card> = []
    
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
