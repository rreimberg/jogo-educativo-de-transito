import flash.Lib;
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


class Match {

    // drawable objetcs
    var stage : Stage;
    var popup : Sprite;
    var message : TextField;
    var playerName : TextField;
    var textFormat : TextFormat;

    // game objects
    var board : GameBoard;
    var dice : Dice;
    var players : Array<Player>;
    var gameStarted : Bool = false;
    var currentPlayerIndex : Int = 0;
    var timer : Timer;

    public function new() {

        this.stage = Lib.current.stage;

        this.players = new Array();

        this.textFormat = new TextFormat();
        this.textFormat.font = "Times New Roman";
        this.textFormat.size = 25;
        this.textFormat.color = 0x000000;

        this.popup = new Sprite();
        this.popup.graphics.beginFill(0x50AB39);
        this.popup.graphics.drawRoundRect(0, 0, 300, 200, 30);
        this.popup.x = this.stage.width / 2 - 150;
        this.popup.y = this.stage.height / 2 - 200;

        this.message = new TextField();
        this.message.setTextFormat(this.textFormat);

        this.playerName = new TextField();
        this.playerName.setTextFormat(this.textFormat);

        this.timer = new Timer(2000, 1);
        this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, this.showRestart);
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
        this.popup.addEventListener(MouseEvent.CLICK, this.playGame);

        this.gameStarted = true;
        this.turn();
    }

    public function finish() {
        this.gameStarted = false;
        this.popup.removeEventListener(MouseEvent.CLICK, this.playGame);

        this.showPopup("VENCEU!!!");

        this.timer.start();
    }

    public function restart(event:MouseEvent) {
        for (player in this.players) {
            player.move(this.board.getInitialField());
        }

        this.message.removeEventListener(MouseEvent.CLICK, this.restart);
        this.start();
    }

    public function turn() {
        if (this.gameStarted == true) {
            this.showPopup("JOGUE O DADO");
        }
    }

    public function showPopup(messageText, restartButton=false) {

        this.stage.addChild(this.popup);

        this.playerName.text = this._getCurrentPlayer().getName();
        this.playerName.x = this.popup.x + 100;
        this.playerName.y = this.popup.y + 10;
        this.stage.addChild(this.playerName);

        this.message.text = messageText;
        this.message.x = this.popup.x + 100;
        this.message.y = this.popup.y + 100;
        this.stage.addChild(this.message);

        if (restartButton == true) {
            this.message.addEventListener(MouseEvent.CLICK, this.restart);
        }
    }

    public function hidePopup() {
        this.stage.removeChild(this.message);
        this.stage.removeChild(this.playerName);
        this.stage.removeChild(this.popup);
    }

    public function playGame(event:MouseEvent) {

        this.hidePopup();

        var steps = this.dice.roll();
        var player = this._getCurrentPlayer();
        var field = this.board.getField(player.getCurrentPosition() + steps);

        player.move(field);

        if (field == this.board.getFinishField()) {
            this.finish();
        }

        this._nextPlayer();
        this.turn();
    }


    public function showRestart(event:TimerEvent) {
        this.timer.stop();
        this.timer.reset();

        this.showPopup("RECOMEÇAR", true);
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
