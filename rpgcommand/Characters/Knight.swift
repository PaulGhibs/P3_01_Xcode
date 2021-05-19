//
//  Knight.swift
//  
//
//  Created by Paul Ghibeaux on 17/05/2021.
//

import Foundation


internal class Knight: Character {
    
    override init(charName fighterName: String) {
        super.init(charName: fighterName)
      life = 70

      self.weapon = Hammer()
    }
}
