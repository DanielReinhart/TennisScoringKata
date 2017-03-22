import Foundation

//this class represents a single tennis game.
class Score {
    var score: Int = 0
}

class Game  {
    var score: String {
        get {
            if "\(servingPlayerScore.score) - \(receivingPlayerScore.score)" == "40 - 40" {
                return "Deuce"
            } else {
                return "\(servingPlayerScore.score) - \(receivingPlayerScore.score)"
            }
        }
    }

    fileprivate var servingPlayerScore = Score()
    fileprivate var receivingPlayerScore = Score()

    fileprivate func updateScore(withScore s: Score) {
        if s.score == 30 {
            s.score += 10
        } else {
            s.score += 15
        }
    }
    
    func servingPlayerWinPoint() {
        updateScore(withScore: servingPlayerScore)
    }

    func receivingPlayerWinPoint() {
        updateScore(withScore: receivingPlayerScore)
    }
}
