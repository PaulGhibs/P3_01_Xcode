//
//  Game.swift
//  
//
//  Created by Paul Ghibeaux on 17/05/2021.
//

import Foundation


class Game {
    // Tab Players for Player 1️⃣ & 2️⃣ / Instances for stats
    let pOne = Player()
    let pTwo = Player()
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
    print("👋 Welcome On RPGCommand 🎲 ⚔️ 🎲")
        print("\n\nTo begin you will be prompt to select 3️⃣ characters in the list by typing a number.")
        print("\n\nWhen you'll choose one we will ask you a name for the character. \n\n⛔️ If you attend to use the same name for each it's not possible ⛔️")
    }
    // Present Character to Player 1️⃣
    func characterPresentation() {
        print("""
          
          1. Warrior 🥷 : \(Warrior(charName: "  🥷").life) life and a 🗡\(Sword().hitGiven)  hit damages.
          2. Sorcerer 🧙‍♂️ : \(Sorcerer(charName: "  🧙‍♂️").life) life and a 🪄\(Wand().hitGiven) life keeps for an allie.
          3. Knight 🏇: \(Knight(charName: "  🏇").life) life and a 🔨\(Hammer().hitGiven) hits.
          4. Dwarf 👹: \(Dwarf(charName: "  👹").life) life and a 🪓\(Axe().hitGiven) hits.
          5. Fairy 🧚‍♀️: \(Fairy(charName: "  🧚‍♀️").life) life and a 🔪\(Knife().hitGiven) hits.
          6. Demon 😈: \(Evil(charName: "  😈").life) life and a ❄️\(IceJet().hitGiven) hits.
          """)
    }
    // Choose character player : 1️⃣ & 2️⃣
    func playerTeamsSetUp() {
        print("\n\n\n--- Player 1️⃣, 👉 You can go ---\n")
        // Player 1 makes his team
        let pOneFightersNameList = pOne.createTeam(listCharactersName: [""])
        print("\n\n\n--- Player 2️⃣, 👉 You can go ---\n")
        // Player 2 makes his team
        _ = pTwo.createTeam(listCharactersName: pOneFightersNameList)
        print("\n\n\n\n--- Player 1️⃣ and Player 2️⃣ teams are set👨‍👦‍👦 --- \n\n!!! 🎯 You're going to fight now 🏹⚔️ !!!\n\n")
    }
    
    // Random Weapon Magic
     func randomChest(for character: Character) {
        let randomChestOnGame = Int(arc4random_uniform(6))

        if randomChestOnGame == 3 {

          if character is Warrior {
            character.weapon = SpecialSword()
          } else if character is Sorcerer {
            character.weapon = SpecialWand()
          } else if character is Knight {
            character.weapon = SpecialHammer()
          } else if character is Fairy {
            character.weapon = SpecialKnife()
          } else if character is Evil {
            character.weapon = SpecialIceJet()
          } else {
            character.weapon = SpecialSword()
          }
         print("\n\n\n 🍀 🌀 A special chest Appeared 🍀 🌀  \n\nYour weapon has now a \(character.weapon!.hitGiven) attack points ⚔️")

          // Variable for game statistics
          magicWeaponTrigger += 1
        }
    }
    // Trigger the chest for magic weapon
     func triggerRandomChest(_ character: Character) -> Bool {
        if character.weapon is SpecialSword || character.weapon is SpecialWand || character.weapon is SpecialAxe
            || character.weapon is SpecialIceJet  || character.weapon is SpecialHammer  || character.weapon is SpecialKnife {
          return true
        }
        return false
    }
    // cure others characters from the team
    func cureOthers(with character: Character, on teamMember: Character) {
        // Giving life points trigger
        character.giveLife(character: teamMember)
        print("\n\n2 \(teamMember.name) feels a bit better. \(teamMember.name) life points\(teamMember.life) is now remaining.")

        // Variables for game statistics
        lifeGive += character.weapon!.hitGiven
        lifeWins += 1

    }
    // Attack ennemy 🤺
     func attack(with character: Character, on opp: Character) {
        // Attack on the ennemie trigger
        character.giveLife(character: opp)

        // Life points stick to zero after an attack instead of going negative
        if opp.life > 0 {
          print("\n \(opp.name) has been attacked.🤺 \(opp.name) life❤️ \(opp.life) points is now remaining.")
        } else {
          opp.life = 0
          print("\n \(opp.name) has 0️⃣ life💔 point remaining.")
        }
        // Variables for statistics
        lifeTook += character.weapon!.hitGiven
        damageDone += 1

        if opp.life <= 0 {
          print("\n!!! \(opp.name.uppercased()) is in ⚰️!!!")
          // Variable for game statistics
          isDead += 1
        }
    }
    // turn to turn
    func playersLoop(playerTurn: Player, opp: Player) {
        print("\n\n--- With what characters 🤺 you want to play ? ---\n")
        // Players see the characters chosen
        playerTurn.presentCharacter()
        // Switch to choose the action fighter
        let character = playerTurn.switchCaracter()
        print("\n\nYou have chosen \(character.name) with a \(character.weapon!.hitGiven) attack points and this weapon  : \(character.weapon!.name).")

        // When the lucky dice is thrown in game to randomly get a stronger weapon
        if triggerRandomChest(character) == false {
          randomChest(for: character)
        }

        // If the Wizard was chosen, the player chooses one of his fighters to give life points back to
        if character.cureOthers() {
          print("\n\n--- Which one of your characters you want to give life ❤️ points back to? ---")
          playerTurn.presentCharacter()
            cureOthers(with: character, on: playerTurn.switchCaracter())
        }
          // If not the Wizard, the player chooses a character to strike
        else {
          print("\n\n--- Which one of your ennemies you want to attack? 🏹 ---")
          opp.presentCharacter()
            attack(with: character, on: opp.switchCaracter())
        }
    }
    // 🔁
     func gameLoop() {
        var isPlayerOneTurn = true

        while pOne.checkWhoLeft() && pTwo.checkWhoLeft() {
          if isPlayerOneTurn {

            print("\n\n--- Player 1️⃣ ,👉 YOUR TURN ! ---")
            playersLoop(playerTurn: pOne, opp: pTwo)
          } else {
            print("\n\n--- Player 2️⃣, 👉 YOUR TURN ! ---")
            playersLoop(playerTurn: pTwo, opp: pOne)
          }

          isPlayerOneTurn = !isPlayerOneTurn
          turn += 1
        }
    }
     // func to congrats the winner
    fileprivate func endgame() {
      if pOne.checkWhoLeft() {
        print("\n\n 👏 Congratulations Player 1️⃣ 🥇! You win 🥇🥇🥇! \n\n")
      } else {
        print("\n\n 👏 Congratulations Player 2️⃣ 🥇! You win🥇🥇🥇! \n\n")
      }
    }

    // This is where the game statistics are grouped to be displayed on screen
    fileprivate func printstats() {
      var player1TotalTurn = 0
      var player2TotalTurn = 0
      // Calculate the time each player has played a turn
      if pOne.checkWhoLeft() {
        player1TotalTurn = turn / 2 + 1
      } else {
        player1TotalTurn = turn / 2
      }
      if pTwo.checkWhoLeft() {
        player2TotalTurn = turn / 21
      } else {
        player2TotalTurn = turn / 2
      }

      print("""
        -- Stats 📈 --
                - 1️⃣ Turns:   \(player1TotalTurn)
                - 2️⃣ Turns:   \(player2TotalTurn)
                - ⚔️Attacks :            \(damageDone)
                - Life Given → :      \(lifeGive)
                - Sorcerers Heals points used:  \(lifeTook)
                - Life Back:   \(lifeWins)
                - 💣🧨🪓Magic Weapon Triggers:   \(magicWeaponTrigger)
                - 🪦 deadsPeople:    \(isDead)
        """)
    }

    // 🎮
    func launch() {
        welcomePrint()
        playerTeamsSetUp()
        gameLoop()
        endgame()
        printstats()
    }
}
