//
//  Stats.swift
//  
//
//  Created by Paul Ghibeaux on 17/05/2021.
//

import Foundation


class Stats {
    
    // Tab Players
    let pOne = Player()
    let pTwo = Player()
    
    // Stats
    var totalAttackMade = 0
    var attackPointsGiven = 0
    var lifePointsGiven = 0
    var lifePointsActionUsed = 0
    var playerTurnNumber = 0
    var magicWeaponTrigger = 0
    var deadChar = 0
    
    func victoryMessage() {
        if pOne.checkWhoLeft() {
        print("\n\n\n--- 👏 Congratulations Player 1️⃣ 🥇! YOU WIN 🥇🥇🥇!  ---\n\n")
      }
      else {
        print("\n\n\n---  👏 Congratulations Player 2️⃣ 🥇! YOU WIN 🥇🥇🥇!  ---\n\n")
      }
    }

     func printStats() {
      var p1TotalTurn = 0
      var p2TotalTurn = 0
      
      // Calculate the time each player has played a turn
      if pOne.checkWhoLeft() {
        p1TotalTurn = playerTurnNumber / 2 + 1
      }
      else {
        p1TotalTurn = playerTurnNumber / 2
      }
      if pTwo.checkWhoLeft() {
        p2TotalTurn = playerTurnNumber / 21
      }
      else {
        p2TotalTurn = playerTurnNumber / 2
      }

      print("""
        -- Stats 📈 --
        
        - 1️⃣ Turns:   \(p1TotalTurn)
        - 2️⃣ Turns:   \(p2TotalTurn)
        - ⚔️Attacks :            \(totalAttackMade)
        - Life Given → :      \(attackPointsGiven)
        - Sorcerers Heals points used:  \(lifePointsActionUsed)
        - Life Back:   \(lifePointsGiven)
        - 💣🧨🪓Magic Weapon Triggers:   \(magicWeaponTrigger)
        - 🪦 deadsPeople:    \(deadChar)
        """)
    }
}
