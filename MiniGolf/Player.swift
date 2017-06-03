//
//  Player.swift
//  MiniGolf
//
//  Created by Alex Krush on 6/3/17.
//  Copyright © 2017 Alex Krush. All rights reserved.
//

import UIKit

class Player: NSObject {
    var name: String = ""
    var points = [Int]()
    
    init(name: String) {
        self.name = name
    }
    
    func getScore() -> Int {
        var total = 0
        for score in points {
            total += score
        }
        
        return total
    }
}
