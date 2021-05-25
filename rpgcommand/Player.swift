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
            if let userChoice = readLine() {
                guard let userNumber = Int(userChoice), userNumber > 0 else {
                print("⛔️ Number Only ⛔️!")
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
                switch userChoice {
                case "1": charactList.append(Warrior(charName: "\(nameChoice.capitalized) 🥷"))
                case "2": charactList.append(Sorcerer(charName: "\(nameChoice.capitalized) 🧙‍♂️"))
                case "3": charactList.append(Knight(charName: "\(nameChoice.capitalized) 🏇"))
                case "4": charactList.append(Dwarf(charName: "\(nameChoice.capitalized) 👹"))
                case "5": charactList.append(Fairy(charName:  "\(nameChoice.capitalized) 🧚‍♀️"))
                case "6": charactList.append(Evil(charName:  "\(nameChoice.capitalized) 😈"))
                default:
                  print("\n!!⛔️  You have not chosen three characters to enter the ring ⛔️ !! \n\n!! Enter a number(1️⃣...6️⃣)associated to a character... !!\n")
                }
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
        for characters in charactList {
            print("\(characters.name), \(characters.life) life points,  \(characters.weapon?.emoji ?? "") \(characters.hitGiven()) attacks strenghts.")
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
            if let player = playerChosen, player.life <= 0 {
                print("\n\n🪦 Dead people cannot be used anymore 🪦\n\nChoose one alive to continue...the game")
                playerChosen = nil
            }
            for _ in charactList {
            playerChosen = charactList[0]
            playerChosen = charactList[1]
            playerChosen = charactList[2]
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
