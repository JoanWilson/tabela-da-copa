//
//  StringWithReplacedCharacters.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 01/10/22.
//

import Foundation

extension String {
    func withReplacedCharacters(_ oldChar: String, by newChar: String) -> String {
        let newStr = self.replacingOccurrences(of: oldChar, with: newChar, options: .literal, range: nil)
        return newStr
    }
}
