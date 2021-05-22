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
            // ask an input for select caracters inside a loop.
            print("\nType a number to choose a character:")
            if let userChoice = readLine() {
                guard let userNumber = Int(userChoice), userNumber > 0 else {
                print("⛔️ Number Only ⛔️!")
                continue
                }
                print("\nName your character:")
                // ask an input for naming caracters
                if let nameChoice = readLine() {
                    if let userNumber = Int(nameChoice), userNumber > 0 {
                        print("⛔️ Text Only ⛔️!")
                        continue
                    }
                    if listCharactersName.contains(nameChoice) {
                        print("⛔️ Name your character uniquely ⛔️!")
                    } else {
                        listCharactersName.append(nameChoice)
                        charactList.append(Character(charName: "\(nameChoice.capitalized)"))
                    }
                }
            }
        }
        playerChoice()
        return listCharactersName
    }
    // show teams characters👨‍👦‍👦
    func playerChoice() {
        print("\n\nYour chosen characters 🤺 are: \n")
        for fighter in charactList {
            print("\(fighter.name)")
        }
    }
    // present for each turn 🔁 which one are still alive
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
