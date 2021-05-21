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
            print("\nName your character:")
            // ask an input for naming caracters
            if let nameChoice = readLine() {
              if listCharactersName.contains(nameChoice) {
                print("\n\n ⛔️ Name your character uniquely ⛔️!")
              } else {
                listCharactersName.append(nameChoice)
                // Number tipped for a choice
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
        playerChoiceConfirm()
        return listCharactersName
    }
    //show teams characters👨‍👦‍👦
    func playerChoiceConfirm() {
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
    
    // switch characters for attacking  🤺 opponent
    func switchCaracter() -> Character {
        var playerChosen: Character?
        while playerChosen == nil {
            if let userChoice = readLine() {
                for _ in charactList {
                    if userChoice == "1" {
                        playerChosen = charactList[0]
                    } else if userChoice == "2" {
                        playerChosen = charactList[1]
                    } else if userChoice == "3" {
                        playerChosen = charactList[2]
                    } else {
                        print("\n!!! Enter a number associated to a character 🤺 to continue !!!\n")
                    }
                }
                if let player = playerChosen, player.life <= 0 {
                    print("\n\n🪦 Dead people cannot be used anymore 🪦\n\nChoose one alive to continue...the game")
                    playerChosen = nil
                }
            }
        }
        return playerChosen!
      }
    
    // check who is still alive in the team 👨‍👦‍👦
    func checkWhoLeft() -> Bool {
        for characters in charactList {
            if characters.life > 0 {
                return true
            }
        }
        return false
    }
}
