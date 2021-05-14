//
//  Character.swift
//  rpgcommand
//
//  Created by Paul Ghibeaux on 14/05/2021.
//

import Foundation


class Character {
    var name: String = ""
    var lifepoints : Int = 0
    var strenght : Int = 0
    var weapon = Weapon()
    var isALive : Bool = true
    var protectPoint = 0
    var healPoint = 40
    var canHeal = true
    
    init(name: String){
        self.name = name
        self.isALive = true
    }
    
}
