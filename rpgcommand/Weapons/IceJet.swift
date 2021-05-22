//
//  IceJet.swift
//  
//
//  Created by Paul Ghibeaux on 18/05/2021.
//

import Foundation

// The weapon used by 😈
internal class IceJet: Weapon {

  init() {
    super.init(hitGiven: 20)
    self.name = "IceJet"
    self.emoji = "❄️"
  }
}

internal class SpecialIceJet: SpecialWeapon {

  init() {
    super.init(hitGiven: 50)
    self.name = "SpecialIceJet"

  }
}
