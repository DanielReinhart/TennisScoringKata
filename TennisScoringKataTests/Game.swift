import Foundation

//this class represents a single tennis game.
class Score {
   private(set) var score: Int = 0
    
    func increase() {
        if score == 30 {
            score += 10
        } else {
            score += 15
        }
    }
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

    func servingPlayerWinPoint() {
        servingPlayerScore.increase()
    }

    func receivingPlayerWinPoint() {
        receivingPlayerScore.increase()
    }
}
