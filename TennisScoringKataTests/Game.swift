import Foundation

//this class represents a single tennis game.

class Game : NSObject {

    static let kAdvantage = 100

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

    //WOW this is so bad.
    func servingPlayerWinPoint() {
        if servingPlayerScore == 30 {
            servingPlayerScore += 10
        } else if servingPlayerScore == 40 {
            servingPlayerScore = Game.kAdvantage
        } else if receivingPlayerScore == Game.kAdvantage {
            receivingPlayerScore = 40
        } else {
            servingPlayerScore += 15
        }
    }

    func receivingPlayerWinPoint() {
        if receivingPlayerScore == 30 {
            receivingPlayerScore += 10
        } else if receivingPlayerScore == 40 {
            receivingPlayerScore = Game.kAdvantage
        } else if receivingPlayerScore == Game.kAdvantage {
            servingPlayerScore = 40
        } else {
            receivingPlayerScore += 15
        }
    }
}
