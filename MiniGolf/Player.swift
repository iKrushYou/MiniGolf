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
    
    init(name: String) {
        super.init()
        
        self.name = name
    }
}
