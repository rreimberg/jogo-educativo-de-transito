import flash.Lib;

import flash.display.Shape;
import flash.display.Stage;

import Dice;
import Player;


class GameBoard {

    // drawable objects
    var fieldSize : Int;
    var totalFields : Int;
    var width : Int;
    var height : Int;
    var stage : Stage;
    var x : Float;
    var y : Float;
    var fields : Array<Shape>;
    var fieldTextFormat : flash.text.TextFormat;

    // game play objects
    var dice : Dice;
    var players : Array<Player>;

    public function new(width, height) {

        this.stage = Lib.current.stage;

        this.fieldTextFormat = new flash.text.TextFormat();
        this.fieldTextFormat.font = "Times New Roman";
        this.fieldTextFormat.size = 16;
        this.fieldTextFormat.color=0xFF0000;

        this.width = width;
        this.height = height;

        this.fields = new Array();
        this.players = new Array();
    }

    public function draw(fields, size) {

        this.fieldSize = size;
        this.totalFields = fields;

        this._validateFieldsDrawing();
        this._drawFrame();
        this._drawFields();
    }

    public function addPlayer(player) {
        this.players.push(player);
        player.move(this.fields[0]);
    }

    public function addDice(dice) {
        this.dice = dice;
    }

    private function _validateFieldsDrawing() {
        var qtdPerLine = this.width / this.fieldSize;
        var qtdPerColumn = (this.height / this.fieldSize) - 2;

        if (this.totalFields > qtdPerColumn + qtdPerLine * 2) {
            throw "You cannot draw this Board";
        }
    }

    private function _drawFrame() {

        this.x = (this.stage.stageWidth - this.width) / 2;
        this.y = (this.stage.stageHeight - this.height) / 2;

        var frame = new Shape();
        frame.graphics.beginFill(0xffffff);
        frame.graphics.drawRect(0, 0, this.width, this.height);
        frame.x = this.x;
        frame.y = this.y;

        this.stage.addChild(frame);
    }

    private function _drawFields() {

        // Draw a simple game path according to frame dimensions
        var x = 0;
        var y = 0;
        var color;
        var direction = 'right';

        for (i in 0...this.totalFields) {

            color = i%2==0?0xd1d1d1:0xe1e1e1;

            var field = new Shape();
            field.graphics.beginFill(color);
            field.graphics.drawRoundRect(0, 0, this.fieldSize, this.fieldSize, 10);
            field.x = this.x + x;
            field.y = this.y + y;
            this.stage.addChild(field);

            // Write text inside field
            var p = new flash.text.TextField();
            p.text = "" + i;
            p.setTextFormat(this.fieldTextFormat);
            p.x = field.x;
            p.y = field.y;
            this.stage.addChild(p);

            // Arrange fields
            if (direction == 'right') {
                x += this.fieldSize;
                if (x >= this.width) {
                    x -= this.fieldSize;
                    direction = 'down';
                }
            }
            if (direction == 'down') {
                y += this.fieldSize;
                if (y >= this.height) {
                    y -= this.fieldSize;
                    direction = 'left';
                }
            }
            if (direction == 'left') {
                x -= this.fieldSize;
            }

            this.fields.push(field);
        }
    }

}
