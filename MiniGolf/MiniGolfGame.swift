//
//  MiniGolfGame.swift
//  MiniGolf
//
//  Created by Alex Krush on 6/4/17.
//  Copyright © 2017 Alex Krush. All rights reserved.
//

import UIKit

class MiniGolfGame: NSObject {
    var date: Date = Date(timeIntervalSinceNow: 0)
    var title: String = ""
    var players = [Player]()
    var holes = [MiniGolfHole]()
    var currentHole = 1
    
    init(title : String, players : [Player]) {
        super.init()
        
        self.title = title
        self.players = players
        holes.append(MiniGolfHole(players: players))
    }
    
    func nextHole() {
        currentHole += 1
        
        if (currentHole > holes.count) {
            holes.append(MiniGolfHole(players: players))
        }
    }
    
    func prevHole() {
        currentHole -= 1
        
        if (currentHole < 1) {
            currentHole = 1
        }
    }
    
    func getScoreForPlayerCurrentHole(player : Player) -> Int {
        return holes[currentHole].getScoreForPlayer(player: player)
    }
    
    func setScoreForPlayerCurrentHole(player : Player, score : Int) {
        holes[currentHole].setScoreForPlayer(player: player, score: score)
    }
}
