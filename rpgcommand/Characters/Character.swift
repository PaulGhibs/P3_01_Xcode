//
//  Character.swift
//  
//
//  Created by Paul Ghibeaux on 14/05/2021.
//

import Foundation

class Character {
    var name: String
    var life: Int
    var weapon: Weapon?
    init(charName: String) {
        life = 0
        self.name = charName
    }
    func hitGiven() -> Int {
        if let charWeapon = weapon {
            return charWeapon.hitGiven
        } else {
            return 0
        }
    }
    func giveLife(character: Character) {
        if cureOthers() == false {
            character.life -= hitGiven()
            print("You took \(hitGiven()) points of life to your ennemy.\n")
        } else if cureOthers() == true {
            character.life += hitGiven()
            print("You gave \(hitGiven()) to a character of your team.\n")
        }
    }
    func cureOthers() -> Bool {
        _ = Warrior(charName:  "")
        _ = Dwarf(charName: "")
        _ = Sorcerer(charName: "")
        return false
    }
}
