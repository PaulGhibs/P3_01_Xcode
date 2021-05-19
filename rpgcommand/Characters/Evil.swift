//
//  File.swift
// 
//
//  Created by Paul Ghibeaux on 17/05/2021.
//

import Foundation


internal class Evil: Character {
    
    override init(charName fighterName: String) {
        super.init(charName: fighterName)
      life = 60

      self.weapon = Sword()
    }
}
