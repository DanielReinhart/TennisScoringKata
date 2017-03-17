import Foundation

//this class represents a single tennis game.

class Game : NSObject {
    var score: String {
        get {
            if "\(servingPlayerScore) - \(receivingPlayerScore)" == "40 - 40" {
                return "Deuce"
            } else {
                return "\(servingPlayerScore) - \(receivingPlayerScore)"
            }
        }
    }

    fileprivate var servingPlayerScore : Int = 0
    fileprivate var receivingPlayerScore : Int = 0

    func servingPlayerWinPoint() {
        if servingPlayerScore == 30 {
            servingPlayerScore += 10
        } else {
            servingPlayerScore += 15
        }
    }

    func receivingPlayerWinPoint() {
        if receivingPlayerScore == 30 {
            receivingPlayerScore += 10
        } else {
            receivingPlayerScore += 15
        }
    }
}
