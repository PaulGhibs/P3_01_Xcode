//
//  Knife.swift
//  
//
//  Created by Paul Ghibeaux on 18/05/2021.
//

import Foundation

// The weapon to be used by the Warrior
internal class Knife: Weapon {

  init() {
    super.init(hitGiven: 10)
    self.name = "knife"

  }
}

internal class SpecialKnife: Weapon {

  init() {
    super.init(hitGiven: 20)
    self.name = "SpecialKnife"

  }
}
