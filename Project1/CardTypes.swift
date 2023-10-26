//
//  CardTypes.swift
//  Project1
//
//  Created by IS 543 on 10/19/23.
//

import Foundation

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
