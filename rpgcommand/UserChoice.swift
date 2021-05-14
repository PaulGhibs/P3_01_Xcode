//
//  UserChoice.swift
//  rpgcommand
//
//  Created by Paul Ghibeaux on 14/05/2021.
//

import Foundation


class UserChoice {
    
    // array players names
    static var nameUsedforPlayer = [String]()
    
    //availability of names
    static var notUsedYet = ["", " "]
    
    
    // enemies array
    static var enemies = [String]()
    
    //store fighters' names
    static var team0FighterName = ["", "", ""]
    static var team1FighterName = ["", "", ""]
    
    //store team members' life
    static var lifeTeam0 = [0, 0, 0]
    static var lifeTeam1 = [0, 0, 0]
    
    
    
}
