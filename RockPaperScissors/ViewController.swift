//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Александр on 21.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var robotButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isHidden = true
    }

    func play(_ sign: Sign){
        let computerSign = randomSign()
        robotButton.setTitle(computerSign.emoji, for: .normal)
        
        switch sign {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        
        resetButton.isHidden = false
        
        let result = sign.takeTurn(computerSign)
        
        switch result {
        case .win:
            statusLabel.text = "It's a win!"
            self.view.backgroundColor = UIColor.green
        case .lose:
            statusLabel.text = "You lose"
            self.view.backgroundColor = UIColor.red
        case .start:
            reset()
        case .draw:
            statusLabel.text = "It's a draw"
            self.view.backgroundColor = UIColor.yellow
        }
    }
    
    func reset() {
        
        statusLabel.text = "Rock, paper, scissors"
        self.view.backgroundColor = UIColor.white
        
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        resetButton.isHidden = false
        
        resetButton.isHidden = true
    }
    
    // Mark: - IBAction
   
    @IBAction func rockButtonPressed(_ sender: Any) {
        play(.rock)
    }
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        play(.scissors)
    }
    @IBAction func paperButtonPressed(_ sender: Any) {
        play(.paper)
    }
    
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        reset()
    }
    
}


