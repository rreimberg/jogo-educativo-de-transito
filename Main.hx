import flash.Lib;

import GameBoard;
import Dice;


// To infinity and beyond!
class Main {

    static function main() {
        var stage = Lib.current.stage;
        var board = new GameBoard(stage, 1080, 720);
        var dice = new Dice(6);

        try {
            board.draw(22, 120);
        } catch (msg : String) {
            trace(msg);
        }
    }

}
