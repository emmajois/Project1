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
    
    var cards: Array<SetGameBrain.Card> {
        game.cards
    }
    var deckSize: Int {
        game.deckSize
    }
    //MARK: - User Intents
    func choose(_ card: SetGameBrain.Card) {
        game.choose(card: card)
    }
    
    func newGame() {
        game = SetGame.createGame()
    }
    
    func addMoreCards() {
        game.threeNewCards()
    }
}
