//
//  Sword.swift
//  
//
//  Created by Paul Ghibeaux on 14/05/2021.
//

import Foundation


// The weapon to be used by the Warrior
internal class Sword: Weapon {

  init() {
    super.init(hitGiven: 10)
    self.name = "Sword"
  }
}


internal class SpecialSword: Weapon {

  init() {
    super.init(hitGiven: 20)
    self.name = "SpecialSword"

  }
}



