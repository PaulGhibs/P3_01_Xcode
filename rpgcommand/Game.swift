//
//  Game.swift
//  
//
//  Created by Paul Ghibeaux on 17/05/2021.
// swiftlint:disable all



import Foundation

class Game {
    // Tab Player 1️⃣ & 2️⃣ / Instances for stats
    let pOne = Player()
    let pTwo = Player()
    // damage
    var damageDone = 0
    // life
    var lifeTook = 0
    var lifeWins = 0
    var lifeGive = 0
    // Magic weapon
    var magicWeaponTrigger = 0
    // players turn
    var turnPlayers = 0
    // Dead characters
    var numberOfCharactersDead = 0
    // Welcoming
    func welcomePrint() {
        print("""
                    \n👋 Welcome On RPGCommand 🎲 ⚔️ 🎲
                    \nTo begin you will be prompt to select 3️⃣ characters in the list by typing a number.
                    \nWhen you'll choose one we will ask you a name for the character.
                    \n\n⛔️ If you attend to use the same name for each it's not possible ⛔️
                    \nIf you choose a sorcerer 🧙‍♂️  or Fairy 🧚‍♀️ you can heal others people of your team at some point
            
            """
            )
    }
    // Present Character to Player 1️⃣
     func characterPresentation() {
        let characters = [Warrior(charName: "Warrior"), Sorcerer(charName: "Sorcerer "), Knight(charName: "Knight "), Dwarf(charName: "Dwarf"), Fairy(charName: "Fairy")]
        for character in characters {
            print("\(character.name) \(character.emoji) a life of \(character.life) and a the weapon \(character.weapon?.name ?? "") \( character.weapon?.emoji ?? "") \(character.weapon?.hitGiven ?? 0) and of hit damages")
        }
    }
    // Choose character player : 1️⃣ & 2️⃣
    func playerTeamsSetUp() {
        print("\n\n\n--- Player 1️⃣, 👉 You can go ---\n")
        // Player 1️⃣ team
        let pOneFightersNameList = pOne.createTeam(listCharactersName: [""])
        print("\n\n\n--- Player 2️⃣, 👉 You can go ---\n")
        // Player 2️⃣ team
        _ = pTwo.createTeam(listCharactersName: pOneFightersNameList)
        print("\n\n\n\n--- Player 1️⃣ and Player 2️⃣ teams are set👨‍👦‍👦 --- \n\n!!! 🎯 You're going to fight now 🏹⚔️ !!!\n\n")
    }
    // Random Weapon Magic
     func randomChest(for character: Character) {
        let randomChestOnGame = Int(arc4random_uniform(6))
        let specialWeaponList = [SpecialWeapon]()
        if randomChestOnGame == 3 {
        for _ in specialWeaponList {
                character.specialWeapon = SpecialWeapon(hitGiven: 0)
        }
        print("\n\n\n 🍀 🌀 A special chest Appeared 🍀 🌀  \n\nYour weapon has now a \(character.weapon!.hitGiven) attack points ⚔️")
          // Variable for game statistics
          magicWeaponTrigger += 1
        }
    }
    // Trigger the chest for magic weapon 🏹
     func triggerRandomChest(_ character: Character) -> Bool {
        if character.specialWeapon != nil {
          return true
        }
        return false
    }
    // cure others ❤️ characters from the team 👨‍👦‍👦
    func cureOthers(with character: Character, on teamMember: Character) {
        // Giving life points trigger
        character.loseLife(character: teamMember)
        print("\n\n2 \(teamMember.name) feels a bit better. \(teamMember.name) life points\(teamMember.life) is now remaining.")

        // Variables for game stats
        lifeGive += character.weapon!.hitGiven
        lifeWins += 1

    }
    // Attack ennemy 🤺
     func attack(with character: Character, on opp: Character) {
        // Attack on the ennemie trigger
        character.loseLife(character: opp)
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
          numberOfCharactersDead += 1
        }
    }
    // turn to turn 🔁
    func playersLoop(playerTurn: Player, opp: Player) {
        print("\n\n--- With what characters 🤺 you want to play ? ---\n")
        // Players see the characters chosen
        playerTurn.presentCharacter()
        // Switch to choose the character to attack  🤺 or heal
        let character = playerTurn.changeCaracter()
        print("\n\nYou have chosen \(character.name) with a \(character.weapon!.hitGiven) attack points and this weapon  : \(String(describing: character.weapon!.name)).")

        // When the lucky chest is thrown in game to randomly get a stronger weapon
        if triggerRandomChest(character) == false {
          randomChest(for: character)
        }

        // If the Sorcerer was pick, the player chooses one of his characters to give life points back to
        if character.cureOthers() {
          print("\n\n--- Which one of your characters you want to give life ❤️ points back to? ---")
          playerTurn.presentCharacter()
            cureOthers(with: character, on: playerTurn.changeCaracter())
        }
          // If not the sorcerer, the player chooses a character to 🤺
        else {
          print("\n\n--- Which one of your ennemies you want to attack? 🏹 ---")
          opp.presentCharacter()
            attack(with: character, on: opp.changeCaracter())
        }
    }
    // 🔁 turn loop until characters are dead 🪦
     func gameLoop() {
        var isPlayerOneTurn = true
        while pOne.checkAlives() && pTwo.checkAlives() {
          if isPlayerOneTurn {
            print("\n\n--- Player 1️⃣ ,👉 Your turn ! ---")
            playersLoop(playerTurn: pOne, opp: pTwo)
          } else {
            print("\n\n--- Player 2️⃣, 👉 Your turn! ---")
            playersLoop(playerTurn: pTwo, opp: pOne)
          }
          isPlayerOneTurn = !isPlayerOneTurn
          turnPlayers += 1
        }
    }
     // func to congrats the winner 🥇
    fileprivate func endgame() {
      if pOne.checkAlives() {
        print("\n\n 👏 Congratulations Player 1️⃣ 🥇! You win 🥇🥇🥇! \n\n")
      } else {
        print("\n\n 👏 Congratulations Player 2️⃣ 🥇! You win🥇🥇🥇! \n\n")
      }
    }

    // This is where the game statistics 📈 are grouped to be displayed at the end
    fileprivate func printstats() {
      var player1TotalTurn = 0
      var player2TotalTurn = 0
      // Calculate the time each player has played a turn
      if pOne.checkAlives() {
        player1TotalTurn = turnPlayers / 2 + 1
      } else {
        player1TotalTurn = turnPlayers / 2
      }
      if pTwo.checkAlives() {
        player2TotalTurn = turnPlayers / 21
      } else {
        player2TotalTurn = turnPlayers / 2
      }

      print("""
        -- Stats 📈 --
                - 1️⃣ Turns:   \(player1TotalTurn)
                - 2️⃣ Turns:   \(player2TotalTurn)
                - ⚔️Attacks :            \(damageDone)
                - ❤️ Life Given → :      \(lifeGive)
                - 🧙‍♂️Sorcerers Heals points used:  \(lifeTook)
                - ❤️ Life Back:   \(lifeWins)
                - 💣🧨🪓Magic Weapon Triggers:   \(magicWeaponTrigger)
                - 🪦 deadsPeople:    \(numberOfCharactersDead)
        """)
    }

    // Game beginning 🎮
    func launch() {
        welcomePrint()
        playerTeamsSetUp()
        gameLoop()
        endgame()
        printstats()
        print("Game Over 🎮")
    }
}
