//
//  Player.swift
//  
//
//  Created by Paul Ghibeaux on 17/05/2021.
//

import Foundation


class Player {
    
    var charactList = [Character]()

    func createTeam(listCharactersName: [String]) -> [String] {
       
        var listCharactersName = listCharactersName
        
        // Present all fighters available
        gameLaunch.characterPresentation()
        
        // Loop for players to select and name their fighters
        while charactList.count < 3 {
          print("\nType a number to choose a character:")
          
          if let userChoice = readLine() {
            print("\nName your character:")
            
            if let nameChoice = readLine() {
              
              if listCharactersName.contains(nameChoice) {
                print("\n\n ⛔️ Name your character uniquely ⛔️!")
              }
              else {
                listCharactersName.append(nameChoice)
                
                switch userChoice {
                case "1":
                    charactList.append(Warrior(charName: "\(nameChoice.capitalized)"))
                case "2":
                  charactList.append(Sorcerer(charName: "\(nameChoice.capitalized)"))
                case "3":
                    charactList.append(Knight(charName: "\(nameChoice.capitalized)"))
                case "4":
                  charactList.append(Dwarf(charName:  "\(nameChoice.capitalized)"))
                case "5":
                  charactList.append(Fairy(charName:  "\(nameChoice.capitalized)"))
                case "6":
                  charactList.append(Evil(charName:  "\(nameChoice.capitalized)"))
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
    
    func playerChoiceConfirm(){
        print("\n\nYour chosen characters 🤺 are: \n")
        for fighter in charactList {
          print("\(fighter.name)")
        }
        print("")
    }
    
    func presentCharacter()  {
        print("""
          
          1:\(charactList[0])  \(charactList[0].name),  \(charactList[0].life) life points,  \(charactList[0].hitGiven()) attacks.
          2:\(charactList[1])  \(charactList[1].name),  \(charactList[1].life) life points,  \(charactList[1].hitGiven()) attacks.
          3:\(charactList[2])  \(charactList[2].name),  \(charactList[2].life) life points.  \(charactList[2].hitGiven()) attacks.
          

          """)
    }
    
    
    func switchCaracter() -> Character {
        var playerChosen: Character?
        
        while playerChosen == nil {
          if let userChoice = readLine() {
            
            switch userChoice {
            case "1":
              playerChosen = charactList[0]
            case "2":
              playerChosen = charactList[1]
            case "3":
              playerChosen = charactList[2]
            case "4":
              playerChosen = charactList[3]
            case "5":
              playerChosen = charactList[4]
            case "6":
              playerChosen = charactList[5]
            default:
              print("\n!!! Enter a number associated to a character 🤺 to continue !!!\n")
            }
            
            if let player = playerChosen, player.life <= 0 {
              print("\n\n🪦 Dead people cannot be used anymore 🪦\n\nChoose one alive to continue...the game")
              playerChosen = nil
            }
          }
        }
        return playerChosen!
      }
    
    
    func checkWhoLeft() -> Bool {
        for characters in charactList {
            if characters.life > 0 {
                return true
            }
        }
        return false
    }
    
}
