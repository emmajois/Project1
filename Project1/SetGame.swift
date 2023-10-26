//
//  SetGame.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import SwiftUI

@Observable class SetGame {
    //MARK: - Properties
    private var game = createGame()

    //MARK: - Model access
    static func createGame() -> SetGameBrain {
        SetGameBrain()
    }
    
    var cards: Array<SetGameBrain.Card>
    {
        return game.dealtCards
    }
    
    var deckSize: Int {
        game.undealtCards.count
    }
    
    //MARK: - User Intents
    func choose(_ card: SetGameBrain.Card) {
        withAnimation(.easeInOut(duration: 0.5)){
            game.choose(card: card)
        }
    }
    
    func newGame() {
        withAnimation(.easeInOut(duration: 5.0)){            
            game = SetGame.createGame()
            startGame()
        }
    }
    
    func addMoreCards() {
        withAnimation(.easeInOut(duration:1.0)){
            game.addNewCards(cardCount: 3)
        }
    }
    
    func startGame() {
        
           game.startGame()
        
    }
}
