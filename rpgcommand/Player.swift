//
//  Player.swift
//  rpgcommand
//
//  Created by Paul Ghibeaux on 14/05/2021.
//

import Foundation




class Player {
    
    var nameofPlayer = String()

    func getName() {
        if let name = readLine() {
            
            //check if name is already token
            if UserChoice.nameUsedforPlayer.contains(name) {
                print("your choice is not valid or this name is already in use"
                        + "\nplease choose another name")
                getName()
            } else {
                
                //set name
                nameofPlayer = name
                
                //append arrays to further check name uniqueness
                UserChoice.nameUsedforPlayer.append(name)
                UserChoice.notUsedYet.append(name)
            }
        }
    }
    
        //set up players' names
        func setUpPlayersNames() {
            
            //getPlayerName is a method of Player
            
            print(">hello \(player0.nameOfPlayer) !"
                + "\n>hello \(player1.nameOfPlayer) !")
            
            //call to wait before clearing tty's window
            //utilities.waitAndClearTty(delay: GlobalProperties.time)
            
            print(">welcome to terminalCombat")
            //utilities.waitAndClearTty(delay: GlobalProperties.time)
            
           
        }
    

}
