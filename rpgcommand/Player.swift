//
//  Player.swift
//  
//
//  Created by Paul Ghibeaux on 17/05/2021.
//  swiftlint:disable all

import Foundation

class Player {
    
    var charactList = [Character]()

    // CreateTeam() ->  sets up the team of 3 characters 👨‍👦‍👦

    func createTeam(listCharactersName: [String]) -> [String] {
        var listCharactersName = listCharactersName
        // Present all caracters 🤺 available 
        gameLaunch.characterPresentation()
        while charactList.count < 3 {
            // ask an input for select caracters inside a loop.
            print("\nType a number to choose a character:")
            if let userChoice = readLine() {
                guard userChoice.contains("") else {
                    print("\n\n ⛔️ Number only ⛔️!")
                    continue
                }
                print("\nName your character:")
                // ask an input for naming caracters
                if let nameChoice = readLine() {
                    if nameChoice.contains("\(userChoice)") {
                        print("\n\n ⛔️ Text only ⛔️!")
                    }
                    if listCharactersName.contains(nameChoice) {
                        print("\n\n ⛔️ Name your character uniquely ⛔️!")
                    } else {
                        listCharactersName.append(nameChoice)
                        // Number tipped for a choice
                        guard let userChoiceNumber = Int(userChoice),
                              userChoiceNumber > 0 && userChoiceNumber <= charactList.count else {
                            charactList.append(Character(charName: "\(nameChoice.capitalized)"))
                            continue
                        }
                    }
                }
            }
            
        }
        playerChoice()
        return listCharactersName
    }
    //show teams characters👨‍👦‍👦
    func playerChoice() {
        print("\n\nYour chosen characters 🤺 are: \n")
        for fighter in charactList {
          print("\(fighter.name)")
        }
        print("")
    }
    //present for each turn 🔁 which one are still alive
    func presentCharacter() {
        for characters in charactList {
            print("\(characters.name),  \(characters.life) life points,  \(characters.hitGiven()) attacks strenghts.")
        }
    }
    // change characters for attacking  🤺 opponent
    func changeCaracter() -> Character {
        var playerChosen: Character?
        while playerChosen == nil {
            guard let userChoice = readLine(),
                let userChoiceNumber = Int(userChoice), userChoiceNumber > 0 && userChoiceNumber <= charactList.count else {
                    playerChosen = nil
                    print("\n!!! Enter a number associated to a character 🤺 to continue !!!\n")
                    continue
                    }
            playerChosen = charactList[userChoiceNumber]

        }
        return playerChosen!
      }
    
    // check who is still alive in the team 👨‍👦‍👦
    func checkAlives() -> Bool {
        for characters in charactList {
            if characters.life > 0 {
                return true
            }
        }
        return false
    }
}
