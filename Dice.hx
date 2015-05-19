import Math;


class Dice {

    var sides : Int;
    var value : Int;

    public function new(sides) {
        this.sides = sides;
    }

    public function roll() {
        var number = Math.round((Math.random() * 1000) % this.sides);
        if (number == 0) {
            number = 1;
        }

        this.value = number;
        return number;
    }

    public function currentValue() {
        return this.value;
    }

}

