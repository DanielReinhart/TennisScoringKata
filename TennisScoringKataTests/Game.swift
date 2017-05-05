import Foundation

//this class represents a single tennis game.
class Score {

    private(set) var totalPointsWon : Int = 0
    var points : Points = .noPoints

    func increase() {
        totalPointsWon += 1
        points.increment()
    }

    func score() -> String {
        return points.stringFromPoints()
    }
}

enum Points: Int {
    case noPoints = 0, onePoint, twoPoints, threePoints, greaterThanThreePoints


    private func scoreFromPoints(numberOfPoints: Int) -> Points {
        if numberOfPoints == 0 {
            return .noPoints
        } else if numberOfPoints == 1 {
            return .onePoint
        } else if numberOfPoints == 2 {
            return .twoPoints
        } else if numberOfPoints == 3 {
            return .threePoints
        } else if numberOfPoints > 3 {
            return .greaterThanThreePoints
        }
        return .noPoints
    }

    mutating func increment() {
        switch self {
        case .noPoints:
            self = .onePoint
        case .onePoint:
            self = .twoPoints
        case .twoPoints:
            self = .threePoints
        case .threePoints:
            self = .greaterThanThreePoints
        case .greaterThanThreePoints:
            self = .greaterThanThreePoints
        }
    }

    func stringFromPoints() -> String {
        switch self {
        case .noPoints:
            return "0"
        case .onePoint:
            return "15"
        case .twoPoints:
            return "30"
        case .threePoints:
            return "40"
        case .greaterThanThreePoints:
            return ""
        }
    }
}

class Game  {
    var score: String {
        get {
            return currentGameScore(servingPlayerScore: servingPlayerScore, receivingPlayerScore: receivingPlayerScore)
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

    private func currentGameScore(servingPlayerScore: Score, receivingPlayerScore: Score) -> String {
        if scoreIsDeuce(score1: servingPlayerScore, score2: receivingPlayerScore) {
            return "Deuce"
        } else if playerHasAdvantage(score1: servingPlayerScore, score2: receivingPlayerScore) {
            if servingPlayerScore.totalPointsWon > receivingPlayerScore.totalPointsWon {
                return "Adv - 40"
            } else {
                return "40 - Adv"
            }
        } else if playerWonGame(score1: servingPlayerScore, score2: receivingPlayerScore) {
            if servingPlayerScore.totalPointsWon > receivingPlayerScore.totalPointsWon {
                return "Game - Serving Player"
            } else {
                return "Game - Receiving Player"
            }

        } else {
            return "\(servingPlayerScore.score()) - \(receivingPlayerScore.score())"
        }
    }

    private func scoreIsDeuce(score1: Score, score2: Score) -> Bool {
        if servingPlayerScore.points == .threePoints && receivingPlayerScore.points == .threePoints ||
            (servingPlayerScore.points == .greaterThanThreePoints && receivingPlayerScore.points == .greaterThanThreePoints &&
            servingPlayerScore.totalPointsWon == receivingPlayerScore.totalPointsWon) {
            return true
        } else {
            return false
        }
    }

    private func playerHasAdvantage(score1: Score, score2: Score) -> Bool {
        return (score1.points == .greaterThanThreePoints && score2.points == .threePoints) ||
            (score1.points == .threePoints && score2.points == .greaterThanThreePoints)
    }

    private func playerWonGame(score1: Score, score2: Score) -> Bool {
        return (score1.points == .greaterThanThreePoints && (score2.points != .greaterThanThreePoints || score2.points != .threePoints)) ||
               (score2.points == .greaterThanThreePoints && (score1.points != .greaterThanThreePoints || score1.points != .threePoints))
    }


}
