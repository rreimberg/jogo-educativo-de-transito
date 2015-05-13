
import Dice;
import GameBoard;
import Match;
import Player;


// To infinity and beyond!
class Main {

    static function main() {
        try {
            var board = new GameBoard(1080, 720, 22, 120);
            var dice = new Dice(6);
            var player1 = new Player('JOGADOR 1', 0x00ff00, 1);
            var player2 = new Player('JOGADOR 2', 0x0000ff, 2);

            var match = new Match();

            match.addBoard(board);
            match.addDice(dice);
            match.addPlayer(player1);
            match.addPlayer(player2);

            match.start();

        } catch (msg : String) {
            trace(msg);
        }
    }

}
