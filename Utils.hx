import flash.display.DisplayObject;


class Utils {

    static public function hide(obj:DisplayObject) {
        obj.visible = false;
    }

    static public function show(obj:DisplayObject) {
        obj.visible = true;
    }

    static public function alignCenter(obj:DisplayObject, reference:DisplayObject) {
        Utils.alignHorizontalyCenter(obj, reference);
        Utils.alignVerticallyCenter(obj, reference);
    }

    static public function alignHorizontalyCenter(obj:DisplayObject, reference:DisplayObject) {
        obj.x = (reference.width / 2) - (obj.width / 2);
    }

    static public function alignVerticallyCenter(obj:DisplayObject, reference:DisplayObject) {
        obj.y = (reference.height / 2) - (obj.height / 2);
    }

}
