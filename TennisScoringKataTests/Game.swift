import Foundation

//this class represents a single tennis game.

class Game : NSObject {
    var score: String = "0 - 0"

    func servingPlayerWinPoint() {
        score = "15 - 0"
    }

    func receivingPlayerWinPoint() {
        score = "0 - 15"
    }
}
