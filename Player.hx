import Std.parseInt;

import flash.Lib;

import flash.display.Shape;
import flash.display.Stage;


class Player {

    // drawable objects
    var stage : Stage;
    var padding : Float = 15.;
    var radius : Float = 30.;
    var position : Int;
    var pin : Shape;

    // player objects
    var name : String;
    var currentPosition : Int;

    public function new(name, color, position) {
        this.stage = Lib.current.stage;
        this.name = name;
        this.position = position;

        this._draw(color);
    }

    public function move(field) {
        this.currentPosition = parseInt(field.name);
        this.pin.x = this.padding + field.x + this.radius * this.position;
        this.pin.y = this.padding + field.y + this.radius * this.position;
    }

    public function getName() {
        return this.name;
    }

    public function getCurrentPosition() {
        return this.currentPosition;
    }

    private function _draw(color) {
        this.pin = new Shape();
        this.pin.graphics.beginFill(color);
        this.pin.graphics.drawCircle(0, 0, this.radius);
        this.pin.x = 300;
        this.pin.y = 300;
        this.stage.addChild(this.pin);

        // Write text inside this.pin
        /*var p = new flash.text.TextField();
        p.text = "" + i;
        p.setTextFormat(this.this.pinTextFormat);
        p.x = this.pin.x;
        p.y = this.pin.y;
        this.stage.addChild(p);*/
    }

}
