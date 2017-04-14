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
        if servingPlayerScore.points == .threePoints && receivingPlayerScore.points == .threePoints {
            return "Deuce"
        }
        return "\(servingPlayerScore.score()) - \(receivingPlayerScore.score())"
    }
}
