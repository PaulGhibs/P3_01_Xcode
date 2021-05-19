//
//  File.swift
//  
//
//  Created by Paul Ghibeaux on 17/05/2021.
//


import Foundation

// The weapon to be used by the Warrior
internal class Wand: Weapon {

  init() {
    super.init(hitGiven: 20)
    self.name = "Wand"

  }
}


internal class SpecialWand: Weapon {

  init() {
    super.init(hitGiven: 40)
    self.name = "SpecialWand"

  }
}
