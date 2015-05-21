import Math;
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

    static public function random(from:Int, to:Int):Int
    {
        return from + Math.floor(((to - from + 1) * Math.random()));
    }

    static public function shuffle<T>(arr:Array<T>):Array<T>
    {
        if (arr!=null) {
            for (i in 0...arr.length) {
                var j = random(0, arr.length - 1);
                var a = arr[i];
                var b = arr[j];
                arr[i] = b;
                arr[j] = a;
            }
        }
        return arr;
    }


}
