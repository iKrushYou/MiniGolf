//
//  GameViewController.swift
//  MiniGolf
//
//  Created by Alex Krush on 6/3/17.
//  Copyright © 2017 Alex Krush. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var holeLabel: UILabel!
    
    public var players = [Player]()
    var miniGolfGame : MiniGolfGame

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(players)
        miniGolfGame = MiniGolfGame(title: "Game", players: players)
        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let playerView = cell.viewWithTag(10) as! PlayerCardView
        
        playerView.player = players[indexPath.row]
        
        
//        cardView.nameLabel.text = players[indexPath.row].name
        
//        cell.addSubview(cardView)
        
        // Configure the cell
        
        return cell
    }

    @IBOutlet weak var backButton: UIButton!
    @IBAction func backRoundAction(_ sender: Any) {
        miniGolfGame.prevHole()
        
        if (miniGolfGame.currentHole == 1) {
            backButton.isEnabled = false
        }
        
        collectionView.reloadData()
        updateView()
    }
    
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func nextRoundAction(_ sender: Any) {
        miniGolfGame.nextHole()
        
        if (miniGolfGame.currentHole == 1) {
            backButton.isEnabled = false
        }
        
        collectionView.reloadData()
        updateView()
    }
    
    func updateView() {
        holeLabel.text = "Hole " + String(miniGolfGame.currentHole)
    }
}
