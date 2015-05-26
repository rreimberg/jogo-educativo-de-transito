import flash.display.Bitmap;

import Math;
import Utils;


class Dice {

    var sides : Int;
    var value : Int;
    var images : Array<Bitmap>;

    public function new(sides) {
        this.sides = sides;

        this.value = 1;

        this.images = new Array<Bitmap>();
        this.images.push(new Bitmap(new ImagesResources.Dice1BitmapData(0, 0)));
        this.images.push(new Bitmap(new ImagesResources.Dice2BitmapData(0, 0)));
        this.images.push(new Bitmap(new ImagesResources.Dice3BitmapData(0, 0)));
        this.images.push(new Bitmap(new ImagesResources.Dice4BitmapData(0, 0)));
        this.images.push(new Bitmap(new ImagesResources.Dice5BitmapData(0, 0)));
        this.images.push(new Bitmap(new ImagesResources.Dice6BitmapData(0, 0)));
    }

    public function roll() {
        this.value = Utils.random(1, 6);
        return this.value;
    }

    public function currentValue() {
        return this.value;
    }

    public function getImage() {
        return this.images[this.value - 1];
    }
}

