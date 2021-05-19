//
//  Axe.swift
//  
//
//  Created by Paul Ghibeaux on 14/05/2021.
//

import Foundation

// The weapon to be used by the Warrior
internal class Axe: Weapon {

  init() {
    super.init(hitGiven: 15)
    self.name = "Axe"

  }
}

internal class SpecialAxe: Weapon {

  init() {
    super.init(hitGiven: 30)
    self.name = "SpecialAxe"

  }
}
