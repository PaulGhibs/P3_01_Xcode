//
//  Weapon.swift
//  
//
//  Created by Paul Ghibeaux on 14/05/2021.
//


import Foundation

// This is where weapons capabilities are
internal class Weapon {

  var hitGiven: Int
  var name: String?

  init(hitGiven: Int) {
    self.hitGiven = hitGiven
    self.name = ""
    
  }
}
