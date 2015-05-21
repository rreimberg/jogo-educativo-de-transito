import flash.Lib;
import flash.display.Bitmap;
import flash.display.Loader;
import flash.display.SimpleButton;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.utils.Timer;

import Match;
import Utils;
import QuizData;
import Question;


class Quiz {

    // drawable objects
    var stage : Stage;
    var quizPopup : Sprite;
    var image : Sprite;
    var questionField : TextField;
    var answer1 : TextField;
    var answer2 : TextField;
    var answer3 : TextField;
    var answer4 : TextField;

    var resultMessage : TextField;

    var timer : Timer;

    var height = 30;
    var padding = 10;

    // quiz objects
    var answerOptions : Map<TextField, String>;
    var match : Match;
    var rightAnwser : Bool;
    var question : Question;
    var data : QuizData;

    public function new(match) {
        this.stage = Lib.current.stage;
        this.match = match;

        this.init();
    }

    private function init() {

        this.data = new QuizData();

        this.quizPopup = new Sprite();
        this.image = new Sprite();
        this.questionField = new TextField();
        this.answer1 = new TextField();
        this.answer2 = new TextField();
        this.answer3 = new TextField();
        this.answer4 = new TextField();

        this.resultMessage = new TextField();

        this.answerOptions = new Map<TextField, String>();

        this.timer = new Timer(1000, 1);
        this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, this.timerListener);

        this.stage.addChild(this.quizPopup);
        this.stage.addChild(this.image);
        this.stage.addChild(this.questionField);
        this.stage.addChild(this.answer1);
        this.stage.addChild(this.answer2);
        this.stage.addChild(this.answer3);
        this.stage.addChild(this.answer4);
        this.stage.addChild(this.resultMessage);

        Utils.hide(this.quizPopup);
        Utils.hide(this.image);
        Utils.hide(this.questionField);
        Utils.hide(this.answer1);
        Utils.hide(this.answer2);
        Utils.hide(this.answer3);
        Utils.hide(this.answer4);
        Utils.hide(this.resultMessage);
    }

    public function ask() {

        this.data.raffle();

        this.quizPopup.graphics.beginFill(0xA2AB39);
        this.quizPopup.graphics.drawRoundRect(0, 0, 300, 400, 30);
        this.quizPopup.width = 300;
        Utils.alignCenter(this.quizPopup, this.stage);
        Utils.show(this.quizPopup);

        //this.message.setTextFormat(this.textFormat);

        this.image.graphics.lineStyle(0, 0);
        this.image.graphics.beginFill(0xA2AB39);
        this.image.graphics.drawRect(0, 0, 300, 100);
        this.image.graphics.endFill();
        this.image.height = 100;

        Utils.show(this.image);
        this.image.x = this.quizPopup.x + this.padding;
        this.image.y = this.quizPopup.y + this.padding;
        this.image.width = this.quizPopup.width - (this.padding * 2);

        this.image.addChild(this.data.getImage());
        Utils.alignCenter(this.data.getImage(), this.image);

        var options = this.data.getOptions();

        this.questionField.text = "Qual o significado dessa placa?";
        this.questionField.x = this.quizPopup.x + this.padding;
        this.questionField.y = image.y + image.height + this.padding;
        this.questionField.height = height;
        this.questionField.width = this.quizPopup.width;
        Utils.show(this.questionField);

        this.answerOptions.set(this.answer1, options[0]);
        this.answer1.text = 'A) ' + options[0];
        this.answer1.x = this.questionField.x;
        this.answer1.y = this.questionField.y + this.questionField.height + this.padding;
        this.answer1.height = height;
        this.answer1.width = this.quizPopup.width;
        this.answer1.addEventListener(MouseEvent.CLICK, this.answer);
        Utils.show(this.answer1);

        this.answerOptions.set(this.answer2, options[1]);
        this.answer2.text = 'B) ' + options[1];
        this.answer2.x = this.questionField.x;
        this.answer2.y = this.answer1.y + this.answer1.height + this.padding;
        this.answer2.height = this.height;
        this.answer2.width = this.quizPopup.width;
        this.answer2.addEventListener(MouseEvent.CLICK, this.answer);
        Utils.show(this.answer2);

        this.answerOptions.set(this.answer3, options[2]);
        this.answer3.text = 'C) ' + options[2];
        this.answer3.x = this.questionField.x;
        this.answer3.y = this.answer2.y + this.answer2.height + this.padding;
        this.answer3.height = this.height;
        this.answer3.width = this.quizPopup.width;
        this.answer3.addEventListener(MouseEvent.CLICK, this.answer);
        Utils.show(this.answer3);

        this.answerOptions.set(this.answer4, options[3]);
        this.answer4.text = 'D) ' + options[3];
        this.answer4.x = this.questionField.x;
        this.answer4.y = this.answer3.y + this.answer3.height + this.padding;
        this.answer4.height = this.height;
        this.answer4.width = this.quizPopup.width;
        this.answer4.addEventListener(MouseEvent.CLICK, this.answer);
        Utils.show(this.answer4);

    }

    public function hideQuestion() {
        Utils.hide(this.image);
        Utils.hide(this.questionField);
        Utils.hide(this.answer1);
        Utils.hide(this.answer2);
        Utils.hide(this.answer3);
        Utils.hide(this.answer4);
        Utils.hide(this.data.getImage());
    }

    public function answer(event:MouseEvent) {
        var option = this.answerOptions.get(event.currentTarget);

        this.hideQuestion();

        this.rightAnwser = this.data.checkAnswer(option);

        this.quizPopup.width = 400;
        this.quizPopup.height = 300;
        Utils.alignCenter(this.quizPopup, this.stage);

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

}
