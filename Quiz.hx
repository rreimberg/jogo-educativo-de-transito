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
    var answer1 : TextField;
    var answer2 : TextField;
    var answer3 : TextField;
    var answer4 : TextField;
    var textFormat : TextFormat;

    var resultMessage : TextField;

    var rightAnwserPopup : Sprite;
    var wrongAnwserPopup : Sprite;

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
        this.rightAnwserPopup = new Sprite();
        this.wrongAnwserPopup = new Sprite();
        this.answer1 = new TextField();
        this.answer2 = new TextField();
        this.answer3 = new TextField();
        this.answer4 = new TextField();

        this.resultMessage = new TextField();

        this.answerOptions = new Map<TextField, String>();

        this.timer = new Timer(1000, 1);
        this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, this.timerListener);

        this.textFormat = new TextFormat();
        this.textFormat.font = "Times New Roman";
        this.textFormat.size = 25;
        this.textFormat.color = 0x000000;

        this.stage.addChild(this.quizPopup);
        this.stage.addChild(this.image);
        this.stage.addChild(this.answer1);
        this.stage.addChild(this.answer2);
        this.stage.addChild(this.answer3);
        this.stage.addChild(this.answer4);
        this.stage.addChild(this.resultMessage);
        this.stage.addChild(this.rightAnwserPopup);
        this.stage.addChild(this.wrongAnwserPopup);

        Utils.hide(this.quizPopup);
        Utils.hide(this.image);
        Utils.hide(this.answer1);
        Utils.hide(this.answer2);
        Utils.hide(this.answer3);
        Utils.hide(this.answer4);
        Utils.hide(this.resultMessage);
        Utils.hide(this.rightAnwserPopup);
        Utils.hide(this.wrongAnwserPopup);

        this.rightAnwserPopup.graphics.drawRect(0, 0, 400, 250);
        this.rightAnwserPopup.height = 250;
        this.rightAnwserPopup.width = 400;
        Utils.alignCenter(this.rightAnwserPopup, this.stage);
        this.rightAnwserPopup.addChild(new Bitmap(new ImagesResources.Right1BitmapData(0, 0)));

        this.wrongAnwserPopup.graphics.drawRect(0, 0, 400, 250);
        this.wrongAnwserPopup.height = 250;
        this.wrongAnwserPopup.width = 400;
        Utils.alignCenter(this.wrongAnwserPopup, this.stage);
        this.wrongAnwserPopup.addChild(new Bitmap(new ImagesResources.Wrong1BitmapData(0, 0)));

    }

    public function ask() {

        this.data.raffle();

        this.quizPopup.graphics.drawRect(0, 0, 650, 350);
        this.quizPopup.width = 650;
        Utils.alignCenter(this.quizPopup, this.stage);
        Utils.show(this.quizPopup);
        this.quizPopup.addChild(new Bitmap(new ImagesResources.QuestionBitmapData(0, 0)));

        this.image.graphics.drawRect(0, 0, 400, 100);
        this.image.height = 100;
        this.image.width = 400;

        Utils.alignHorizontalyCenter(this.image, this.quizPopup);
        this.image.y = this.quizPopup.y + 40;
        this.image.width = this.quizPopup.width - (this.padding * 2);
        Utils.show(this.image);

        this.image.addChild(this.data.getImage());
        Utils.alignCenter(this.data.getImage(), this.image);

        var options = this.data.getOptions();

        this.answerOptions.set(this.answer1, options[0]);
        this.answer1.htmlText = '<a href="event:null">A) ' + options[0] + '</a>';
        this.answer1.x = this.quizPopup.x + this.padding;
        this.answer1.y = this.image.y + this.image.height + this.padding;
        this.answer1.height = height;
        this.answer1.width = this.quizPopup.width;
        this.answer1.setTextFormat(this.textFormat);
        this.answer1.addEventListener(MouseEvent.CLICK, this.answer);
        Utils.show(this.answer1);

        this.answerOptions.set(this.answer2, options[1]);
        this.answer2.htmlText = '<a href="event:null">B) ' + options[1] + '</a>';
        this.answer2.x =  this.quizPopup.x + this.padding;
        this.answer2.y = this.answer1.y + this.answer1.height + this.padding;
        this.answer2.height = this.height;
        this.answer2.width = this.quizPopup.width;
        this.answer2.setTextFormat(this.textFormat);
        this.answer2.addEventListener(MouseEvent.CLICK, this.answer);
        Utils.show(this.answer2);

        this.answerOptions.set(this.answer3, options[2]);
        this.answer3.htmlText = '<a href="event:null">C) ' + options[2] + '</a>';
        this.answer3.x =  this.quizPopup.x + this.padding;
        this.answer3.y = this.answer2.y + this.answer2.height + this.padding;
        this.answer3.height = this.height;
        this.answer3.width = this.quizPopup.width;
        this.answer3.setTextFormat(this.textFormat);
        this.answer3.addEventListener(MouseEvent.CLICK, this.answer);
        Utils.show(this.answer3);

        this.answerOptions.set(this.answer4, options[3]);
        this.answer4.htmlText = '<a href="event:null">D) ' + options[3] + '</a>';
        this.answer4.x =  this.quizPopup.x + this.padding;
        this.answer4.y = this.answer3.y + this.answer3.height + this.padding;
        this.answer4.height = this.height;
        this.answer4.width = this.quizPopup.width;
        this.answer4.setTextFormat(this.textFormat);
        this.answer4.addEventListener(MouseEvent.CLICK, this.answer);
        Utils.show(this.answer4);

    }

    public function hideQuestion() {
        Utils.hide(this.quizPopup);
        Utils.hide(this.image);
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

        if (this.rightAnwser) {
            Utils.show(this.rightAnwserPopup);
        } else {
            Utils.show(this.wrongAnwserPopup);
        }

        this.timer.start();
    }

    public function timerListener(event:TimerEvent) {
        Utils.hide(this.quizPopup);
        Utils.hide(this.resultMessage);
        Utils.hide(this.rightAnwserPopup);
        Utils.hide(this.wrongAnwserPopup);

        this.timer.stop();
        this.timer.reset();

        this.match.resumeGame(this.rightAnwser);
    }

}
