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

    var gamestats = Game()
   
    
    func victoryMessage() {
        if pOne.checkWhoLeft() {
        print("\n\n\n 👏 Congratulations Player 1️⃣ 🥇! YOU WIN 🥇🥇🥇! \n\n")
      }
      else {
        print("\n\n\n 👏 Congratulations Player 2️⃣ 🥇! YOU WIN 🥇🥇🥇!  \n\n")
      }
    }

     func printStats() {
      var p1TotalTurn = 0
      var p2TotalTurn = 0
      
      // Calculate the time each player has played a turn
      if pOne.checkWhoLeft() {
        p1TotalTurn = gamestats.turn / 2 + 1
      }
      else {
        p1TotalTurn = gamestats.turn / 2
      }
      if pTwo.checkWhoLeft() {
        p2TotalTurn = gamestats.turn / 21
      }
      else {
        p2TotalTurn = gamestats.turn / 2
      }

      print("""
        -- Stats 📈 --
        - 1️⃣ Turns:   \(p1TotalTurn)
        - 2️⃣ Turns:   \(p2TotalTurn)
        - ⚔️Attacks :            \(gamestats.damageDone)
        - Life Given → :      \(gamestats.lifeGive)
        - Sorcerers Heals points used:  \(gamestats.lifeTook)
        - Life Back:   \(gamestats.lifeWins)
        - 💣🧨🪓Magic Weapon Triggers:   \(gamestats.magicWeaponTrigger)
        - 🪦 deadsPeople:    \(gamestats.isDead)
        """)
    }
}
