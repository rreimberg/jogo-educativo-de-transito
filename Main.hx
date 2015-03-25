import flash.Lib;
import flash.display.Shape;
import flash.display.Stage;


class Main {

    static function main() {
        var stage = Lib.current.stage;
        var board = new Main.GameBoard(stage, 1200, 800);

        try {
            board.draw(20, 120);
        } catch (msg : String) {
            trace(msg);
        }
    }

}


class GameBoard {

    var fieldSize : Int;
    var totalFields : Int;
    var width : Int;
    var height : Int;
    var stage : Stage;
    var x : Float;
    var y : Float;

    public function new(stage, width, height) {

        this.width = width;
        this.height = height;
        this.stage = stage;

    }

    public function draw(fields, size) {

        this.fieldSize = size;
        this.totalFields = fields;

        this._validateFieldsDrawing();
        this._drawFrame();
        this._drawFields();

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
        var list = new Array();

        for (i in 0...this.totalFields) {

            var field = new Shape();
            field.graphics.beginFill(0xd1d1d1);
            field.graphics.drawRoundRect(0, 0, this.fieldSize, this.fieldSize, 10);
            field.x = this.x + x;
            field.y = this.y + y;
            this.stage.addChild(field);

            if (y < (this.height - this.fieldSize)) {
                x += this.fieldSize;
                if (x >= this.width) {
                    x -= this.fieldSize;
                    y += this.fieldSize;
                }
            } else {

                y = this.height - this.fieldSize;
                x -= this.fieldSize;
            }

            list.push(field);
        }
    }

}
