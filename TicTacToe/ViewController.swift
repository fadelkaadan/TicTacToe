//
//  ViewController.swift
//  TicTacToe
//
//  Created by Fadel Kaadan on 7/29/17.
//  Copyright © 2017 Fadel Kaadan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var player = 1
    var field = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winner : Int = 0
    var active : Bool = true

    @IBOutlet var buttonOUTLET: [UIButton]!
   
    @IBOutlet weak var optionOneOUTLET: UIButton!
    @IBOutlet weak var optionTwoOUTLET: UIButton!
    @IBOutlet weak var optionThrOUTLET: UIButton!
   
    @IBOutlet weak var fieldContainerOUTLET: UIImageView!
    @IBOutlet weak var fieldOUTLET: UIImageView! //field
    @IBOutlet weak var newGameOUTLET: UIButton!
    @IBOutlet weak var mainMenuOUTLET: UIButton!
    
    @IBOutlet weak var whoWins: UILabel!
    
    @IBAction func pPMode(_ sender: AnyObject) {
        while (field[sender.tag] == 0 && active == true) {
            if (player == 1) {
                sender.setImage(UIImage(named: "x"), for: UIControlState())
                field[sender.tag] = player
                player = 2
            }
            else {
                sender.setImage(UIImage(named: "o"), for: UIControlState())
                field[sender.tag] = player
                player = 1
            }
        }
        getWinner()
    }
    
    
    @IBAction func newGame(_ sender: AnyObject) {
        clearGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        optionOneOUTLET?.layer.cornerRadius = 7
        optionTwoOUTLET?.layer.cornerRadius = 7
        optionThrOUTLET?.layer.cornerRadius = 7
        
        fieldContainerOUTLET?.clipsToBounds = false
        fieldContainerOUTLET?.layer.shadowColor = UIColor.black.cgColor
        fieldContainerOUTLET?.layer.shadowRadius = 7
        fieldContainerOUTLET?.layer.shadowOpacity = 0.7
        fieldContainerOUTLET?.layer.shadowOffset = CGSize.zero
        fieldContainerOUTLET?.layer.shadowPath = UIBezierPath(roundedRect: (fieldOUTLET?.bounds)!, cornerRadius: 7).cgPath
        
        fieldOUTLET?.layer.cornerRadius = 7
        fieldOUTLET?.clipsToBounds = true
        
        newGameOUTLET?.layer.cornerRadius = 7
        mainMenuOUTLET?.layer.cornerRadius = 7
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getWinner() {
        rules()
        if (active == false) {
            whoWins.text = "Player \(winner) wins"
        }
    }
    
    func rules() {
        //horizontly
        for i in stride(from: 0, to: 7, by: 3){
            if(field[i] != 0 && field[i] == field[i+1] && field[i] == field[i + 2]){
                winner = field[i]
                active = false
            }
        }
        //vertically
        for j in stride(from: 0, to: 3, by: 1) {
            if (field[j] != 0 && field[j] == field[j + 3] && field[j] == field[j + 6]) {
                winner = field[j]
                active = false
            }
        }
        
        if (field[0] != 0 && field[0] == field[4] && field[0] == field[8]) {
            winner = field[0]
            active = false
        }
        
        if (field[2] != 0 && field[2] == field[4] && field[2] == field[6]) {
            winner = field[2]
            active = false
        }
    }
    
    func clearGame() {
        active = true
        player = 1
        winner = 0
        whoWins.text = "P vs. P"
        for x in 0...field.count - 1 {
            field[x] = 0
            buttonOUTLET[x].setImage(nil, for: .normal)
        }
    }
}

