//
//  SetGame.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import SwiftUI

@Observable class SetGame {
    //MARK: - Properties
    private var game = SetGameBrain<Array<(String, String, String, Int)>>()
    
    //MARK: - Model access
    var cards: Array<SetGameBrain<Array<(String, String, String, Int)>>.Card> {
        game.cards
    }
    
    //MARK: - User Intents
    func choose(card: SetGameBrain<Array<(String, String, String, Int)>>.Card){
        game.choose(card: card)
    }
}
