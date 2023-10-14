//
//  SetGame.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import SwiftUI

@Observable class SetGame {
    //MARK: - Properties
    private var game = SetGameBrain<String>()

    //MARK: - Model access
    var cards: Array<SetGameBrain<String>.Card> {
        game.cards
    }
    
    //MARK: - User Intents
    func choose(_ card: SetGameBrain<String>.Card) {
        game.choose(card: card)
    }
}
