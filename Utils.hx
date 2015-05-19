import flash.display.DisplayObject;


class Utils {

    static public function hide(obj:DisplayObject) {
        obj.x = -1000;
        obj.y = -1000;
    }

    static public function alignCenter(obj:DisplayObject, reference:DisplayObject) {
        Utils.alignHorizontalyCenter(obj, reference);
        Utils.alignVerticallyCenter(obj, reference);
    }

    static public function alignHorizontalyCenter(obj:DisplayObject, reference:DisplayObject) {
        obj.x = (reference.width / 2) - (obj.width / 2);
    }

    static public function alignVerticallyCenter(obj:DisplayObject, reference:DisplayObject) {
        obj.x = (reference.height / 2) - (obj.width / 2);
    }

}
