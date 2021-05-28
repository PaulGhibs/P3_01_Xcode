//
//  Player.swift
//  
//
//  Created by Paul Ghibeaux on 17/05/2021.
// swiftlint:disable all

import Foundation

class Player {
    var charactList = [Character]()
    // CreateTeam() ->  sets up the team of 3 characters 👨‍👦‍👦
    func createTeam(listCharactersName: [String]) -> [String] {
        var listCharactersName = listCharactersName
        // Present all caracters 🤺 available
        gameLaunch.characterPresentation()
        while charactList.count < 3 {
            print("\nType a number to choose a character:")
            //
            guard let userChoice = readLine(), let userNumber = Int(userChoice), userNumber > 0 && userNumber <= Game.characters.count  else {
                print("⛔️ Number Only / Invalid ⛔️!")
                continue
            }
            print("\nName your character:")
            if let nameChoice = readLine() {
                if let userNumber = Int(nameChoice), userNumber > 0 {
                    print("⛔️ Text Only ⛔️!")
                    continue
                }
                if listCharactersName.contains(nameChoice) {
                    print("⛔️ Name your character uniquely ⛔️!")
                } else {
                    listCharactersName.append(nameChoice)
                    if let userNumber = Int(userChoice), userNumber > 0 && userNumber <= Game.characters.count  {
                        let characterSelected = Game.characters[userNumber-1]
                        characterSelected.name = "\(nameChoice.capitalized) \(characterSelected.emoji)"
                        charactList.append(characterSelected)
                        
                        continue
                    } else {
                        print("\n!!⛔️  You have not chosen three characters to enter the ring ⛔️ !! \n\n!! Enter a number associated to a character... !!\n")
                    }
                    
                }
            }
            
        }
        showTeamsCharacters()
        return listCharactersName
    }
    
    // show teams characters👨‍👦‍👦
    func showTeamsCharacters() {
        print("\n\nYour chosen characters 🤺 are: \n")
        for fighter in charactList {
            print("\(fighter.name)")
        }
    }
    // present for each turn 🔁 which one are still alive
    func presentCharacter() {
        for (index, character) in charactList.enumerated() {
            print("\(index+1) \(character.name), \(character.life) life points,  \(character.weapon.emoji ) \(character.hitGiven()) attacks strenghts.")
        }
    }
    // change characters for attacking  🤺 opponent
    func changeCaracter() -> Character {
        var playerChosen: Character?
        while playerChosen == nil {
            guard let userChoice = readLine(),
                  let userChoiceNumber = Int(userChoice),
                  userChoiceNumber > 0 && userChoiceNumber <= charactList.count else {
                playerChosen = nil
                print("\n!!! Enter a number associated to a character 🤺 to continue !!!  \n")
                continue
            }
            
            playerChosen = charactList[userChoiceNumber-1]
            
            if let player = playerChosen, player.life <= 0 {
                print("\n\n🪦 Dead people cannot be used anymore 🪦\n\nChoose one alive to continue...the game")
                playerChosen = nil
            }
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
