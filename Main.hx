import flash.Lib;

import Dice;
import GameBoard;
import Player;


// To infinity and beyond!
class Main {

    static function main() {
        var board = new GameBoard(1080, 720);
        try {
            board.draw(22, 120);

            var dice = new Dice(6);
            var player1 = new Player('player1', 0x00ff00, 1);
            var player2 = new Player('player2', 0x0000ff, 2);

            board.addDice(dice);
            board.addPlayer(player1);
            board.addPlayer(player2);
        } catch (msg : String) {
            trace(msg);
        }
    }

}
