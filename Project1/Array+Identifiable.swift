//
//  Array+Identifiable.swift
//  Project1
//
//  Created by IS 543 on 10/13/23.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching targetElement: Element) -> Int? {
        for index in self.indices {
            if self[index].id == targetElement.id {
                return index
            }
        }
        return nil
    }
}
