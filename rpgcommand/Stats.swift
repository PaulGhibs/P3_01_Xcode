//
//  Stats.swift
//  rpgcommand
//
//  Created by Paul Ghibeaux on 17/05/2021.
//

import Foundation


class Stats {
    
    // Tab Players
    let pOne = Player()
    let pTwo = Player()
    var totalAttackMade = 0
    var attackPointsGiven = 0
    var lifePointsGiven = 0
    var lifePointsActionUsed = 0
    var playerTurnNumber = 0
    var luckyWeaponTrigger = 0
    var deadFighters = 0
    
    func victoryMessage() {
        if pOne.checkWhoLeft() {
        print("\n\n\n--- CONGRATULATIONS PLAYER ONE! YOU WIN !  ---\n\n")
      }
      else {
        print("\n\n\n---  CONGRATULATIONS PLAYER TWO! YOU WIN !  ---\n\n")
      }
    }

     func printStats() {
      var player1TotalTurn = 0
      var player2TotalTurn = 0
      
      // Calculate the time each player has played a turn
      if pOne.checkWhoLeft() {
        player1TotalTurn = playerTurnNumber / 2 + 1
      }
      else {
        player1TotalTurn = playerTurnNumber / 2
      }
      if pTwo.checkWhoLeft() {
        player2TotalTurn = playerTurnNumber / 21
      }
      else {
        player2TotalTurn = playerTurnNumber / 2
      }

      print("""
        
        -- General Game Statistics --
        
        - Player One Total Turns:   \(player1TotalTurn)
        - Player Two Total Turns:   \(player2TotalTurn)
        - Total Attacks:            \(totalAttackMade)
        - Total Attack Points:      \(attackPointsGiven)
        - Total Wizard' s Actions:  \(lifePointsActionUsed)
        - Total Life Points Back:   \(lifePointsGiven)
        - Lucky Weapon Triggered:   \(luckyWeaponTrigger)
        - Fighters Dead in Game:    \(deadFighters)
        
        
        
        """)
    }
}
