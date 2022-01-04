//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Александр on 21.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var wins = 0
    private var loses = 0
    private var draws = 0
    
    @IBOutlet weak var robotButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        resetButton.backgroundColor = UIColor.blue
        
        resetButton.isHidden = true
    }
    
    
    // MARK: - IBActions
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
    
    // MARK: - Methods
    private func play(_ sign: Sign){
        let computerSign = randomSign()
        let result = sign.takeTurn(computerSign)
        
        robotButton.setTitle(computerSign.emoji, for: .normal)
        resetButton.isHidden = false
        
        switch result {
        case .win:
            statusLabel.text = "It's a win!"
            wins += 1
            self.view.backgroundColor = UIColor.green
        case .lose:
            statusLabel.text = "You lose"
            loses += 1
            self.view.backgroundColor = UIColor.red
        case .start:
            reset()
        case .draw:
            statusLabel.text = "It's a draw"
            draws += 1
            self.view.backgroundColor = UIColor.yellow
        }
    }
    
    private func resetResults() {
        robotButton.setTitle("🤡", for: .normal)
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        wins = 0
        loses = 0
        draws = 0
    }
    
    private func reset() {
        statusLabel.text = "Wins: \(wins)\nLoses: \(loses)\nDraws: \(draws)"
        //resetResults()
        
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        resetButton.isHidden = false
        
        resetButton.isHidden = true
    }
    
}


