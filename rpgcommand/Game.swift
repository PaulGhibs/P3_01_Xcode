//
//  Game.swift
//  
//
//  Created by Paul Ghibeaux on 17/05/2021.
//

import Foundation


class Game  {
    // Tab Players for Player 1️⃣ & 2️⃣ / Instances for stats
    let pOne = Player()
    let pTwo = Player()
    let stats = Stats()
    
    // Stats, lifepoints, and damage
    var damageDone = 0
    var lifeTook = 0
    var lifeWins = 0
    var lifeGive = 0
    var magicWeaponTrigger = 0
    var turn = 0
    var isDead = 0
    
    
    // Welcoming
    func welcomePrint() {
        print("👋 Welcome On RPGCommand 🎲 ⚔️ 🎲 \n\nTo begin you will be prompt to select 3️⃣ characters in the list,by typing a number.\n\nWhen you'll choose one we will ask you a name for the character. \n\n⛔️ If you attend to use the same name for each it's not possible ⛔️")
    }
    
    // Present Character to Player 1️⃣
    
    func characterPresentation() {
        print("\nWarrior 🥷: \(Warrior(charName: "  🥷").life) life and a \(Sword().hitGiven) hit damages.\nSorcerer 🧙‍♂️: \(Sorcerer(charName: "  🧙‍♂️").life) life and a \(Wand().hitGiven) life keeps for an allie.\nKnight 🏇: \(Knight(charName: "  🏇").life) life and a \(Hammer().hitGiven) hits.\nDwarf 👹: \(Dwarf(charName: "  👹").life) life and a \(Axe().hitGiven) hits.\nFairy 🧚‍♀️: \(Fairy(charName: "  🧚‍♀️").life) life and a \(Knife().hitGiven) hits.\nDemon 😈: \(Evil(charName: " 😈").life) life and a \(IceJet().hitGiven) hits.")

    }
    
    // Choose character player : 1️⃣ & 2️⃣
    func playerTeamsSetUp(){
        print("\n\nPlayer 1️⃣, 👉 You can go")
        // Player 1 makes his team
        let pOneFightersNameList = pOne.createTeam(listCharactersName: [""])
        
        print("\n\nPlayer 2️⃣, 👉 You can go")
        // Player 2 makes his team
        _ = pTwo.createTeam(listCharactersName: pOneFightersNameList)
        
        print("\n\nPlayer 1️⃣ and Player 2️⃣ teams are set👨‍👦‍👦\n\n ⚱️ You're going to fight now 🏹⚔️ !!!\n")
        
    }
    
    // Random Weapon Magic
    
     func randomChest(for character: Character){
        let randomChestOnGame = Int(arc4random_uniform(6))

        if randomChestOnGame == 3 {

          if character is Warrior {
            character.weapon = SpecialSword()
          }
          else if character is Sorcerer {
            character.weapon = SpecialWand()
          }
          else if character is Knight {
            character.weapon = SpecialHammer()
          }
          else if character is Fairy {
            character.weapon = SpecialKnife()
          }
          
          else if character is Evil {
            character.weapon = SpecialIceJet()
          }
          else {
            character.weapon = SpecialSword()
          }
          print("\n\n\n 🍀 🌀A special chest Appeared🍀 🌀  \n\nYour weapon has now a \(character.weapon!.hitGiven) attack points ⚔️")

          // Variable stats
          magicWeaponTrigger += 1
        }
    }
    
    // Trigger the chest for magic weapon
     func triggerRandomChest(_ character: Character) -> Bool{
        if character.weapon is SpecialSword || character.weapon is SpecialWand || character.weapon is SpecialAxe  || character.weapon is SpecialIceJet  || character.weapon is SpecialHammer  || character.weapon is SpecialKnife {
          return true
        }
        return false
    }
    
    
    // cure others characters from the team
    
    func cureOthers(with character: Character, on TeamMember: Character) {
        
        // Giving life points trigger
        character.giveLife(character: TeamMember)
        print("\n\n\(TeamMember) \(TeamMember.name) feels a bit better. \(TeamMember.name) life points is now remaining.")

        // Variables for game statistics
        lifeGive += character.weapon!.hitGiven
        lifeWins += 1

    }
    
    // Attack ennemy
    
     func attack(with character: Character, on opp: Character){
        // Attack on the ennemie trigger
        character.giveLife(character: opp)

        // Life points stick to zero after an attack instead of going negative
        if opp.life > 0 {
          print("\n \(opp.name) has been attacked.🤺 \(opp.name) life ❤️ \(opp.life) points is now remaining.")
        }
        else {
          opp.life = 0
          print("\n\(opp.name) has 0️⃣ life💔 point remaining.")
        }
        // Variables for statistics
        lifeTook += character.weapon!.hitGiven
        damageDone += 1

        if opp.life <= 0 {
          print("\n!!! \(opp.name.uppercased()) !!!")
          // Variable for game statistics
          isDead += 1
        }
    }
    
    
    // Loop for chosen characters
    
    func playersLoop(playerTurn: Player, opp: Player) {
        print("\n\nWith what characters 🤺 you want to play ?\n")
        // Players see the characters chosen
        playerTurn.presentCharacter()
        // Switch to choose the action fighter
        let character = playerTurn.switchCaracter()
        print("\n\nYou have chosen \(character.name) with a \(character.weapon!.hitGiven) attack points \(String(describing: character.weapon!)).")
        // When the lucky dice is thrown in game to randomly get a stronger weapon
        if triggerRandomChest(character) == false {
          randomChest(for: character)
        }
        // If the Wizard was chosen, the player chooses one of his fighters to give life points back to
        if character.cureOthers() {
          print("\n\nOne of your characters is dying with who you want to revive❤️ him ?? ")
          playerTurn.presentCharacter()
            cureOthers(with: character, on: playerTurn.switchCaracter())
        }
          // If not the Wizard, the player chooses a character to strike
        else {
          print("\n\nWhich one of your ennemies you want to attack? 🏹 ")
          opp.presentCharacter()
            attack(with: character, on: opp.switchCaracter())
        }
    }
    
    // 🔁
    
     func gameLoop(){
        var isPlayerOneTurn = true
        while pOne.checkWhoLeft() && pTwo.checkWhoLeft() {
          if isPlayerOneTurn {
            print("\n\nPlayer 1️⃣, 👉 Your turn!")
            playersLoop(playerTurn: pOne, opp: pTwo)
          }
          else {
            print("\n\nPlayer 2️⃣, 👉 Your turn ! ")
            playersLoop(playerTurn: pOne, opp: pTwo)
          }
          isPlayerOneTurn = !isPlayerOneTurn
          turn += 1
        }
        
        
    }
    
//    func leaveOrLaunchNew(){
//        print("\n\n Let's do another one ? \n\n Press 1️⃣ ")
//        print("\n\n Want to go 🔜? \n\nAppuyez sur 2 ")
//    }
    
    // 🎮
    func launch() {
        welcomePrint()
        playerTeamsSetUp()
        gameLoop()
        stats.victoryMessage()
        stats.printStats()
        
        
    }
    
}
