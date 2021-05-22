//
//  Sword.swift
//  
//
//  Created by Paul Ghibeaux on 14/05/2021.
//

import Foundation

// The weapon used by 🥷
internal class Sword: Weapon {

  init() {
    super.init(hitGiven: 20)
    self.name = "Sword"
    self.emoji = "🗡"
  }
}

internal class SpecialSword: SpecialWeapon {

  init() {
    super.init(hitGiven: 30)
    self.name = "SpecialSword"

  }
}
