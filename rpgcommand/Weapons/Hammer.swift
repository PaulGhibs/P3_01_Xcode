//
//  Hammer.swift
//  
//
//  Created by Paul Ghibeaux on 14/05/2021.
//

import Foundation



internal class Hammer: Weapon {

  init() {
    super.init(hitGiven: 30)
    self.name = "Hammer"

  }
}

internal class SpecialHammer: Weapon {

  init() {
    super.init(hitGiven: 50)
    self.name = "SpecialHammer"

  }
}



