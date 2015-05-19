import flash.Lib;
import flash.display.SimpleButton;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.utils.Timer;


import Match;
import Utils;


class Quiz {

    // drawable objects
    var stage : Stage;
    var quizPopup : Sprite;
    var image : TextField;
    var question : TextField;
    var awnser1 : TextField;
    var awnser2 : TextField;
    var awnser3 : TextField;
    var awnser4 : TextField;

    var resultMessage : TextField;


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

        this.quizPopup = new Sprite();
        this.image = new TextField();
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

        this.timer = new Timer(2000, 1);
        this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, this.timerListener);
    }

    public function ask() {

        this.quizPopup.graphics.beginFill(0xA2AB39);
        this.quizPopup.graphics.drawRoundRect(0, 0, 300, 400, 30);
        Utils.alignCenter(this.quizPopup, this.stage);

        //this.message.setTextFormat(this.textFormat);

        image.text = '';
        image.x = this.stage.width / 2 - 150;
        image.y = this.quizPopup.y + padding;
        image.height = 40;

        question.text = "Qual o significado dessa placa?";
        question.x = this.quizPopup.x + padding;
        question.y = image.y + image.height + padding;
        question.height = height;
        question.width = this.quizPopup.width;

        awnser1.text = 'A) Vire a direita';
        awnser1.x = question.x;
        awnser1.y = question.y + question.height + padding;
        awnser1.height = height;
        awnser1.width = this.quizPopup.width;
        awnser1.addEventListener(MouseEvent.CLICK, this.awnser);

        awnser2.text = 'B) Proibido estacionar';
        awnser2.x = question.x;
        awnser2.y = awnser1.y + awnser1.height + padding;
        awnser2.height = height;
        awnser2.width = this.quizPopup.width;
        awnser2.addEventListener(MouseEvent.CLICK, this.awnser);

        awnser3.text = 'C) Lombada';
        awnser3.x = question.x;
        awnser3.y = awnser2.y + awnser2.height + padding;
        awnser3.height = height;
        awnser3.width = this.quizPopup.width;
        awnser3.addEventListener(MouseEvent.CLICK, this.awnser);

        awnser4.text = 'D) Limite de velocidade';
        awnser4.x = question.x;
        awnser4.y = awnser3.y + awnser3.height + padding;
        awnser4.height = height;
        awnser4.width = this.quizPopup.width;
        awnser4.addEventListener(MouseEvent.CLICK, this.awnser);

        this.stage.addChild(quizPopup);
        this.stage.addChild(image);
        this.stage.addChild(question);
        this.stage.addChild(awnser1);
        this.stage.addChild(awnser2);
        this.stage.addChild(awnser3);
        this.stage.addChild(awnser4);

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

        this.stage.addChild(this.resultMessage);
        this.timer.start();
    }

    public function timerListener(event:TimerEvent) {
        Utils.hide(this.quizPopup);
        Utils.hide(this.resultMessage);

        this.timer.stop();
        this.timer.reset();

        this.match.resumeGame(this.rightAnwser);
    }

}
