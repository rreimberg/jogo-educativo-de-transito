import flash.Lib;
import flash.display.Bitmap;
import flash.display.Loader;
import flash.display.SimpleButton;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.utils.Timer;


import Match;
import Utils;


class Quiz {

    // drawable objects
    var stage : Stage;
    var quizPopup : Sprite;
    var image : Sprite;
    var question : TextField;
    var awnser1 : TextField;
    var awnser2 : TextField;
    var awnser3 : TextField;
    var awnser4 : TextField;

    var resultMessage : TextField;

    var urlreq:URLRequest;
    var url:URLLoader;
    var picloader:Loader;


    var timer : Timer;

    var height = 30;
    var padding = 10;

    // quiz objects
    var buttonToFrame : Map<TextField, Int>;
    var match : Match;
    var rightAnwser : Bool;

    public function new(match) {
        this.stage = Lib.current.stage;
        this.match = match;

        this.init();
    }

    private function init() {

        this.quizPopup = new Sprite();
        this.image = new Sprite();
        this.question = new TextField();
        this.awnser1 = new TextField();
        this.awnser2 = new TextField();
        this.awnser3 = new TextField();
        this.awnser4 = new TextField();

        this.resultMessage = new TextField();

        this.buttonToFrame = new Map<TextField, Int>();
        this.buttonToFrame.set(this.awnser1, 1);
        this.buttonToFrame.set(this.awnser2, 2);
        this.buttonToFrame.set(this.awnser3, 3);
        this.buttonToFrame.set(this.awnser4, 4);

        this.timer = new Timer(1000, 1);
        this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, this.timerListener);

        this.stage.addChild(this.quizPopup);
        this.stage.addChild(this.image);
        this.stage.addChild(this.question);
        this.stage.addChild(this.awnser1);
        this.stage.addChild(this.awnser2);
        this.stage.addChild(this.awnser3);
        this.stage.addChild(this.awnser4);
        this.stage.addChild(this.resultMessage);

        Utils.hide(this.quizPopup);
        Utils.hide(this.image);
        Utils.hide(this.question);
        Utils.hide(this.awnser1);
        Utils.hide(this.awnser2);
        Utils.hide(this.awnser3);
        Utils.hide(this.awnser4);
        Utils.hide(this.resultMessage);
    }

    public function ask() {

        this.quizPopup.graphics.beginFill(0xA2AB39);
        this.quizPopup.graphics.drawRoundRect(0, 0, 300, 400, 30);
        Utils.alignCenter(this.quizPopup, this.stage);
        Utils.show(this.quizPopup);

        //this.message.setTextFormat(this.textFormat);

        this.image.graphics.lineStyle(1,0);
        this.image.graphics.beginFill(0xCCCCCC);
        this.image.graphics.drawRect(0,0,30,30);
        this.image.graphics.endFill();

        this.urlreq = new URLRequest("../imagens/placas/R-25A.gif");
        this.url = new URLLoader(urlreq);
        this.picloader = new Loader();

        this.url.addEventListener(Event.COMPLETE, this.getlist);

        //Utils.alignHorizontalyCenter(this.image, this.quizPopup);
        this.image.x = this.quizPopup.x;
        this.image.y = this.quizPopup.y + padding;
        this.image.height = 40;

        this.question.text = "Qual o significado dessa placa?";
        this.question.x = this.quizPopup.x + padding;
        this.question.y = image.y + image.height + padding;
        this.question.height = height;
        this.question.width = this.quizPopup.width;
        Utils.show(this.question);

        this.awnser1.text = 'A) Vire a direita';
        this.awnser1.x = question.x;
        this.awnser1.y = question.y + question.height + padding;
        this.awnser1.height = height;
        this.awnser1.width = this.quizPopup.width;
        this.awnser1.addEventListener(MouseEvent.CLICK, this.awnser);
        Utils.show(this.awnser1);

        this.awnser2.text = 'B) Proibido estacionar';
        this.awnser2.x = question.x;
        this.awnser2.y = awnser1.y + awnser1.height + padding;
        this.awnser2.height = height;
        this.awnser2.width = this.quizPopup.width;
        this.awnser2.addEventListener(MouseEvent.CLICK, this.awnser);
        Utils.show(this.awnser2);

        this.awnser3.text = 'C) Lombada';
        this.awnser3.x = question.x;
        this.awnser3.y = awnser2.y + awnser2.height + padding;
        this.awnser3.height = height;
        this.awnser3.width = this.quizPopup.width;
        this.awnser3.addEventListener(MouseEvent.CLICK, this.awnser);
        Utils.show(this.awnser3);

        this.awnser4.text = 'D) Limite de velocidade';
        this.awnser4.x = question.x;
        this.awnser4.y = awnser3.y + awnser3.height + padding;
        this.awnser4.height = height;
        this.awnser4.width = this.quizPopup.width;
        this.awnser4.addEventListener(MouseEvent.CLICK, this.awnser);
        Utils.show(this.awnser4);

        /*for(var i:int = 1; i < 4; i++) {
            var btn:Button = this["t" + i.toString()];
            buttonToFrame[btn] = i;
            btn.addEventListener(MouseEvent.CLICK, this.onClick);
        }*/
    }

    public function hideQuestion() {
        Utils.hide(this.question);
        Utils.hide(this.awnser1);
        Utils.hide(this.awnser2);
        Utils.hide(this.awnser3);
        Utils.hide(this.awnser4);
    }

    public function awnser(event:MouseEvent) {
        var option = this.buttonToFrame.get(event.currentTarget);

        this.hideQuestion();

        this.rightAnwser = (option==1);

        this.quizPopup.width = 400;
        this.quizPopup.height = 300;

        this.resultMessage.text = "Resposta ERRADA :( !!!";
        this.resultMessage.x = this.quizPopup.x + this.padding;
        this.resultMessage.y = this.quizPopup.y + this.padding;
        this.resultMessage.width = this.quizPopup.width;
        this.resultMessage.height = 40;

        if (this.rightAnwser) {
            this.resultMessage.text = "Resposta Certa :) !!!";
        }

        Utils.show(this.resultMessage);
        this.timer.start();
    }

    public function timerListener(event:TimerEvent) {
        Utils.hide(this.quizPopup);
        Utils.hide(this.resultMessage);

        this.timer.stop();
        this.timer.reset();

        this.match.resumeGame(this.rightAnwser);
    }

    public function getlist(evt:Event) {
        this.picloader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.gotpic);
        this.picloader.load(urlreq);
        this.url.removeEventListener(Event.COMPLETE, this.getlist);
    }

    public function gotpic(evt:Event) {
        var mm:Bitmap = new Bitmap();
        mm = evt.target.content;
        this.image.addChild(mm);
        mm.x = this.image.x;
        mm.y = this.image.y;
        this.picloader.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.gotpic);
        trace('oi');
    }

}
