//
//  Warrior.swift
//  rpgcommand
//
//  Created by Paul Ghibeaux on 14/05/2021.
//

import Foundation


internal class Warrior: Character {
    
    override init(charName fighterName: String) {
        super.init(charName: fighterName)
      life = 70

      self.weapon = Sword()
    }
}
