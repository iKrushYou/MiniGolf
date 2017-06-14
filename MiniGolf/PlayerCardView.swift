//
//  PlayerCardView.swift
//  MiniGolf
//
//  Created by Alex Krush on 6/3/17.
//  Copyright © 2017 Alex Krush. All rights reserved.
//

import UIKit

@IBDesignable class PlayerCardView: UIView {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UILabel!
    @IBOutlet weak var roundScoreLabel: UILabel!
    
    public var miniGolfGame: MiniGolfGame!
    public var player : Player!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
    }
    
    @IBAction func plusAction(_ sender: Any) {
        var holeScore = miniGolfGame.getScoreForPlayerCurrentHole(player: player)
        holeScore += 1;
        
        miniGolfGame.setScoreForPlayerCurrentHole(player: player, score: holeScore)
        updateView()
    }
    
    @IBAction func minusAction(_ sender: Any) {
        var holeScore = miniGolfGame.getScoreForPlayerCurrentHole(player: player)
        holeScore -= 1;
        
        if (holeScore < 0) {
            holeScore = 0
        }
        
        miniGolfGame.setScoreForPlayerCurrentHole(player: player, score: holeScore)
        updateView()
    }
    
    var view: UIView!
    
    func xibSetup() {
        view = loadViewFromNib()
        
        view.frame = bounds
        
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
        
        updateView()
    }
    
    func updateView() {
        if ((player) != nil) {
            nameLabel.text = player.name
            currentScoreLabel.text = String(player.getTotalScore())
            roundScoreLabel.text = String(player.getRoundScore())
        }
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PlayerCardView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
}
