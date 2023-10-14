//
//  SetGame.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import SwiftUI

@Observable class SetGame {
    
//    func cardContentFiller(for shapeVal: String, colorVal: String, fillVal: String, countVal:Int) -> Array<(String, String, String, Int)> {
//        return CardContent(shape: shapeVal, color: colorVal, fill: fillVal, count: countVal)
////        return [("Something", "Something", "Something", 1)]
    //}
    //MARK: - Properties
    private var game = SetGameBrain<(String, String, String, Int)>(cardContentFactory: { shape, color, fill, count in
        return (shape, color, fill, count)
    })
    //var cardContentData = (SetGameBrain<Any>.ShapeEnum, SetGameBrain<Any>.ColorEnum, SetGameBrain<Any>.FillEnum, Int)
    //MARK: - Model access
    var cards: Array<SetGameBrain<(String, String, String, Int)>.Card> {
        game.cards
    }
    
    //MARK: - User Intents
    func choose(card: SetGameBrain<(String, String, String, Int)>.Card) {
        game.choose(card: card)
    }
}
