import flash.Lib;
import flash.display.Bitmap;
import flash.display.Shape;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.utils.Timer;

import GameBoard;
import Dice;
import Player;
import Quiz;
import Utils;


class Match {

    // drawable objetcs
    var stage : Stage;
    var popup : Sprite;
    var message : TextField;
    var playerName : TextField;
    var textFormat : TextFormat;

    var player1Popup : Sprite;
    var player2Popup : Sprite;
    var player1Winner : Sprite;
    var player2Winner : Sprite;
    var dicePlace : Sprite;

    // game objects
    var board : GameBoard;
    var dice : Dice;
    var players : Array<Player>;
    var gameStarted : Bool = false;
    var currentPlayerIndex : Int = 0;
    var timer : Timer;
    var quiz : Quiz;

    public function new() {

        this.stage = Lib.current.stage;

        this.init();

        this.players = new Array();
        this.quiz = new Quiz(this);
    }

    private function init() {

        this.textFormat = new TextFormat();
        this.textFormat.font = "Times New Roman";
        this.textFormat.size = 25;
        this.textFormat.color = 0x000000;

        this.dicePlace = new Sprite();
        this.dicePlace.graphics.drawRect(0, 0, 100, 100);
        this.dicePlace.width = 100;
        this.dicePlace.height = 100;
        this.dicePlace.x = 50;
        this.dicePlace.y = 350;

        /*this.player1Popup = new Sprite();
        this.player1Popup.graphics.drawRect(0, 0, 300, 200);
        this.player1Popup.width = 300;
        this.player1Popup.height = 200;
        this.player1Popup.addChild(new Bitmap(new ImagesResources.Player1PopupBitmapData(0, 0)));
        this.player1Popup.addEventListener(MouseEvent.CLICK, this.playGame);

        this.player2Popup = new Sprite();
        this.player2Popup.graphics.drawRect(0, 0, 300, 200);
        this.player2Popup.width = 300;
        this.player2Popup.height = 200;
        this.player2Popup.addChild(new Bitmap(new ImagesResources.Player2PopupBitmapData(0, 0)));
        this.player2Popup.addEventListener(MouseEvent.CLICK, this.playGame);
*/
        this.player1Winner = new Sprite();
        this.player1Winner.graphics.drawRect(0, 0, 300, 300);
        this.player1Winner.width = 300;
        this.player1Winner.height = 300;
        this.player1Winner.addChild(new Bitmap(new ImagesResources.Player1WinnerBitmapData(0, 0)));
        this.player1Winner.addEventListener(MouseEvent.CLICK, this.restart);

        this.player2Winner = new Sprite();
        this.player2Winner.graphics.drawRect(0, 0, 300, 300);
        this.player2Winner.width = 300;
        this.player2Winner.height = 300;
        this.player2Winner.addChild(new Bitmap(new ImagesResources.Player2WinnerBitmapData(0, 0)));
        this.player2Winner.addEventListener(MouseEvent.CLICK, this.restart);

        this.timer = new Timer(1200, 1);
        // this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, this.showRestart);

        this.stage.addChild(this.dicePlace);
        this.stage.addChild(this.player1Winner);
        this.stage.addChild(this.player2Winner);

        this.hidePopup();
    }

    public function addBoard(board) {
        this.board = board;
    }

    public function addPlayer(player) {
        this.players.push(player);
        player.move(this.board.getInitialField());
    }

    public function addDice(dice) {
        this.dice = dice;
    }

    public function start() {
        this.gameStarted = true;
        this.dicePlace.addChild(this.dice.getImage());
        this.turn();
    }

    public function finish() {
        this.gameStarted = false;

        var popup = this.currentPlayerIndex==0 ? this.player1Winner : this.player2Winner;

        Utils.alignCenter(popup, this.stage);
        Utils.show(popup);
    }

    public function restart(event:MouseEvent) {
        this.hidePopup();

        for (player in this.players) {
            player.move(this.board.getInitialField());
        }

        this.currentPlayerIndex = 0;
        this.start();
    }

    public function turn() {
        if (this.gameStarted) {
            this.dicePlace.addEventListener(MouseEvent.CLICK, this.playGame);
        }
    }

    public function hidePopup() {
        Utils.hide(this.player1Winner);
        Utils.hide(this.player2Winner);
    }

    public function playGame(event:MouseEvent) {
        this.dicePlace.removeEventListener(MouseEvent.CLICK, this.playGame);
        this.dice.roll();
        this.dicePlace.addChild(this.dice.getImage());
        this.quiz.ask();
    }

    public function resumeGame(rightAwnser) {

        if (rightAwnser) {
            var player = this._getCurrentPlayer();
            var field = this.board.getField(player.getCurrentPosition() + this.dice.currentValue());

            player.move(field);

            if (field == this.board.getFinishField()) {
                this.finish();
            }
        }

        this._nextPlayer();
        this.turn();
    }

    private function _nextPlayer() {
        this.currentPlayerIndex += 1;
        if (this.currentPlayerIndex >= this.players.length) {
            this.currentPlayerIndex = 0;
        }
    }

    private function _getCurrentPlayer() {
        return this.players[this.currentPlayerIndex];
    }

}
