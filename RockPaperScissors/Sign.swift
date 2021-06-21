//
//  Sign.swift
//  RockPaperScissors
//
//  Created by Александр on 21.06.2021.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .scissors
    } else {
        return .paper
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .paper:
            return "✋🏻"
        case .rock:
            return "✊🏻"
        case .scissors:
            return "✌🏻"
        }
    }
    
    func takeTurn(_ oposite: Sign) -> GameState {
        switch (self, oposite) {
        case (.rock, .rock),
             (.scissors, .scissors),
             (.paper, .paper):
            return .draw
        case (.rock, .scissors),
             (.scissors, .paper),
             (.paper, .rock):
            return .win
        default:
            return .lose
        }
    }
    
    func takeTurnAnotherVersion(_ oposite: Sign) -> GameState {
        switch self {
        case .rock:
            switch oposite {
            case .rock:
                return .draw
            case .scissors:
                return .win
            case .paper:
                return .lose
            }
        case .paper:
            switch oposite {
            case .rock:
                return .win
            case .scissors:
            return .lose

            case .paper:
                return .draw
                        }
        case .scissors:
            switch oposite {
            case .rock:
                return .lose
            case .scissors:
                return .draw
                
            case .paper:
                return .win
            }
        }
    }
}
