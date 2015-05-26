import flash.Lib;

import flash.display.Bitmap;
import flash.display.Shape;
import flash.display.Sprite;
import flash.display.Stage;

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

    public function new(width, height, fields, size) {

        this.stage = Lib.current.stage;

        this.width = width;
        this.height = height;
        this.fieldSize = size;
        this.totalFields = fields;

        this.fields = new Array();

        this.draw();
    }

    public function getInitialField() {
        return this.fields[0];
    }

    public function getFinishField() {
        return this.fields[this.totalFields - 1];
    }

    public function getField(position) {
        if (position < 0)
            return this.getInitialField();

        if (position >= this.totalFields)
            return this.getFinishField();

        return this.fields[position];
    }

    public function draw() {
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

        var frame = new Sprite();
        frame.graphics.beginFill(0xffffff);
        frame.graphics.drawRect(0, 0, this.width, this.height);
        frame.x = this.x;
        frame.y = this.y;

        frame.addChild(new Bitmap(new ImagesResources.BoardBitmapData(0, 0)));

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
            field.name = "" + i;
            //field.graphics.beginFill(color);
            field.graphics.drawRoundRect(0, 0, this.fieldSize, this.fieldSize, 10);
            field.x = this.x + x;
            field.y = this.y + y;
            this.stage.addChild(field);

            // Arrange fields
            if (direction == 'right') {
                x += this.fieldSize;
                if (i == 8) {
                    x -= this.fieldSize;
                    direction = 'down';
                }
            }
            if (direction == 'down') {
                y += this.fieldSize;
                if (i == 13) {
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
