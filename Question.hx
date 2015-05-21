import flash.display.Bitmap;


class Question {

    var description : String;
    var image : Bitmap;

    public function new(description, image) {
        this.description = description;
        this.image = image;
    }

    public function check(answer) {
        return answer == this.description;
    }

    public function getImage() {
        return this.image;
    }

    public function getDescription() {
        return this.description;
    }
}
