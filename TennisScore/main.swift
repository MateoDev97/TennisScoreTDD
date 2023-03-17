//
//  main.swift
//  TennisScore
//
//  Created by Mateo Ortiz on 16/03/23.
//

class TennisGame {
    
    var score: [Score] = [.zero, .zero]
    var games: [Int] = [0, 0]

    func incrementScore(player: Player) {
        switch score[player.rawValue] {
        case .zero:
            score[player.rawValue] = .fifteen
        case .fifteen:
            score[player.rawValue] = .thirty
        case .thirty:
            score[player.rawValue] = .forty
        case .forty, .advantage:
            validateIfIsWonGameOrAdvantage(player: player)
        }
    }
    
    func validateIfIsWonGameOrAdvantage(player: Player) {
        
        let leftIndex = player.rawValue
        
        let rightIndex = (player == .one) ? 1 : 0
        
        if score[leftIndex] == .forty && score[rightIndex] == .zero {
            increaseGameAndResetScore(player: player)
        } else if score[leftIndex] == .forty && score[rightIndex] == .fifteen {
            increaseGameAndResetScore(player: player)
        } else if score[leftIndex] == .forty && score[rightIndex] == .thirty {
            increaseGameAndResetScore(player: player)
        } else if score[leftIndex] == .forty && score[rightIndex] == .forty {
            score[leftIndex] = .advantage
        } else if score[leftIndex] == .forty && score[rightIndex] == .advantage {
            score[leftIndex] = .forty
            score[rightIndex] = .forty
        } else if score[leftIndex] == .advantage && score[rightIndex] == .forty {
            increaseGameAndResetScore(player: player)
        }
        
    }
    
    func increaseGameAndResetScore(player: Player) {
        score = [.zero, .zero]
        games[player.rawValue] += 1
    }
    
}

enum Score {
    case zero
    case fifteen
    case thirty
    case forty
    case advantage
}

enum Player: Int {
    case one = 0
    case two = 1
}
