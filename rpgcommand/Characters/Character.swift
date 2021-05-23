//
//  Character.swift
//  
//
//  Created by Paul Ghibeaux on 14/05/2021.
//

import Foundation

class Character {
    // class Character
    // instance name, life❤️, weapon🪓
    var name: String
    var life: Int
    var emoji = ""
    var weapon: Weapon?
    var specialWeapon: SpecialWeapon?
    init(charName: String) {
        life = 0
        self.name = charName
    }
    // This function removes life points to a character.
    func hitGiven() -> Int {
        if let charWeapon = weapon {
            return charWeapon.hitGiven
        } else {
            return 0
        }
    }
    // This function give life points to a character allie.
    func loseLife(character: Character) {
        if cureOthers() == false {
            character.life -= hitGiven()
            print("You took \(hitGiven()) points of life to your ennemy.\n")
        } else if cureOthers() == true {
            character.life += hitGiven()
            print("You gave \(hitGiven()) to a character of your team.\n")
        }
    }
    // select character to cure
    func cureOthers() -> Bool {
        _ = Warrior(charName: "")
        _ = Dwarf(charName: "")
        _ = Sorcerer(charName: "")
        _ = Fairy(charName: "")
        _ = Knight(charName: "")
        _ = Evil(charName: "")
        return false
    }
}
