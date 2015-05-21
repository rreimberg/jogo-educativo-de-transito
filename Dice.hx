import Math;
import Utils;


class Dice {

    var sides : Int;
    var value : Int;

    public function new(sides) {
        this.sides = sides;
    }

    public function roll() {
        this.value = Utils.random(1, 6);
        return this.value;
    }

    public function currentValue() {
        return this.value;
    }

}

