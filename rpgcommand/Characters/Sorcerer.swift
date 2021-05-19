//
//  Sorcerer.swift
//  
//
//  Created by Paul Ghibeaux on 14/05/2021.
//

import Foundation

internal class Sorcerer: Character {
    
    override init(charName fighterName: String) {
        super.init(charName: fighterName)
      life = 50

      self.weapon = Wand()
    }
    
    override func cureOthers() -> Bool {
        _ = Sorcerer(charName: "")
        return true
    }
}
