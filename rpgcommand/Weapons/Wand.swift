//
//  File.swift
//  
//
//  Created by Paul Ghibeaux on 17/05/2021.
//

import Foundation

// The weapon used by 🧙‍♂️

internal class Wand: Weapon {

  init() {
    super.init(hitGiven: 20)
    self.name = "Wand"
    self.emoji = "🪄"

  }
}

internal class SpecialWand: SpecialWeapon {

  init() {
    super.init(hitGiven: 40)
    self.name = "SpecialWand"

  }
}
