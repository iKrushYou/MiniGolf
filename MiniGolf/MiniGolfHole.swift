//
//  MiniGolfHole.swift
//  MiniGolf
//
//  Created by Alex Krush on 6/4/17.
//  Copyright © 2017 Alex Krush. All rights reserved.
//

import UIKit

class MiniGolfHole: NSObject {
    var scores = [Player : Int]()
    
    init(players : [Player]) {
        super.init()
        
        for player in players {
            scores[player] = 0
        }
    }
    
    func getScores() -> [Player : Int] {
        return scores
    }
    
    func setScoreForPlayer(player : Player, score : Int) {
        scores[player] = score
    }
    
    func getScoreForPlayer(player : Player) -> Int {
        return scores[player]!
    }
}
