//
//  IceJet.swift
//  
//
//  Created by Paul Ghibeaux on 18/05/2021.
//

import Foundation


// The weapon to be used by the Warrior
internal class IceJet: Weapon {

  init() {
    super.init(hitGiven: 20)
    self.name = "IceJet"

  }
}

internal class SpecialIceJet: Weapon {

  init() {
    super.init(hitGiven: 50)
    self.name = "SpecialIceJet"

  }
}


