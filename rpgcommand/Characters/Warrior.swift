//
//  Warrior.swift
//
//
//  Created by Paul Ghibeaux on 14/05/2021.
//

import Foundation

// Warrior 🥷 character

internal class Warrior: Character {
    override init(charName fighterName: String) {
        super.init(charName: fighterName)
      life = 100

      self.weapon = Sword()
    }
}
