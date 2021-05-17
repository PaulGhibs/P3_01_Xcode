//
//  Game.swift
//  rpgcommand
//
//  Created by Paul Ghibeaux on 17/05/2021.
//

import Foundation


class Game  {
    // Tab Players
    let pOne = Player()
    let pTwo = Player()
    let stats = Stats()
    
    // Statistics, lifepoints, and damage
    var damageDone = 0
    var lifeTook = 0
    var lifeWins = 0
    var lifeGive = 0
    var magicWeaponTrigger = 0
    var turn = 0
    var isDead = 0
    
    
    
    fileprivate func welcomePrint() {
        print("👋 Welcome On RPGCommand 🎲 ⚔️ 🎲 \n\n To begin you will be prompt to select 3 characters in the list, by typing a number, \n\n When you'll choose one we  will ask you a name for the character. If you attend to use the same name for each it's not possible ⛔️")
    }
    
    
    func characterPresentation() {
        print("""
          
          1. Warrior:   \(Warrior(charName: "").life) life points and a \(Sword().hitGiven) hit damages.
          2. Sorcerer:    \(Sorcerer(charName: "").life) life points and a \(Sceptre().hitGiven) life points care for a teammate.
          3. Knight:  \(Knight(charName: "").life) life points and a \(Punch().hitGiven) hit damages.
          
          4. Dwarf: \(Dwarf(charName: "").life) life points and a \(Axe().hitScore) hit damages.
          
          """)

    }
    
    
    func playerTeamsSetUp(){
        print("\n\n\n--- PLAYER ONE, YOUR TURN ---\n")
        // Player 1 makes his team
        let pOneFightersNameList = pOne.createTeam(listCharactersName: [""])
        
        print("\n\n--- PLAYER TWO, YOUR TURN ---\n")
        // Player 2 makes his team
        _ = pTwo.createTeam(listCharactersName: pOneFightersNameList)
        
        print("\n\n\n\n--- Player 1 and Player 2 teams are ready, time to get serious! --- \n\n!!! Prepare for the fight !!!\n\n")    }
    
    fileprivate func randomChest(for character: Character){
        let randomChestOnGame = Int(arc4random_uniform(6))

        if randomChestOnGame == 3 {

          if character is Warrior {
            character.weapon = SpecialSword()
          }
          else if character is Sorcerer {
            character.weapon = SpecialSceptre()
          }
          else if character is Knight {
            character.weapon = SpecialPunch()
          }
          else {
            character.weapon = SpecialAxe()
          }
          print("\n\n\n🍀 OPEN A SPECIAL CHEST\n\nYour weapon has now a \(character.weapon!.hitGiven) attack points ⚔️")

          // Variable for game statistics
          magicWeaponTrigger += 1
        }
    }
    
    fileprivate func triggerRandomChest(_ character: Character) -> Bool{
        if character.weapon is SpecialSword || character.weapon is SpecialPunch || character.weapon is SpecialAxe {
          return true
        }
        return false
    }
    
    
    func cureOthers(with character: Character, on TeamMember: Character) {
        // Giving life points trigger
        character.giveLife(character: TeamMember)
        print("\n\n\(TeamMember) \(TeamMember.name) feels a bit better. \(TeamMember.name) life points is now remaining.")

        // Variables for game statistics
        lifeGive += character.weapon!.hitGiven
        lifeWins += 1

    }
    
    
    fileprivate func attack(with character: Character, on opp: Character){
        // Attack on the ennemie trigger
        character.giveLife(character: opp)

        // Life points stick to zero after an attack instead of going negative
        if opp.life > 0 {
          print("\n\(opp) \(opp.name) has been attacked. \(opp.name) life points is now remaining.")
        }
        else {
          opp.life = 0
          print("\n\(opp) \(opp.name) has 0 life point remaining.")
        }
        // Variables for game statistics
        lifeTook += character.weapon!.hitGiven
        damageDone += 1

        if opp.life <= 0 {
          print("\n!!! \(opp.name.uppercased()) !!!")
          // Variable for game statistics
          isDead += 1
        }
    }
    
    fileprivate func playersLoop(playerTurn: Player, opp: Player) {
        
    }
    
    fileprivate func gameLoop(){
        
    }
    
    func launch() {
        welcomePrint()
        
        playerTeamsSetUp()
        gameLoop()
        stats.victoryMessage()
        stats.printStats()
        
    }
    
}
