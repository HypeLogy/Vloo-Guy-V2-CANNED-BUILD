package;

import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.group.FlxSpriteGroup;
import flixel.FlxG;
import flixel.FlxSprite;

using StringTools;

class FreeplayState extends MusicBeatState{
	var songs:Array<String> = ["guy", "midnight", "nightwatch", "terminated", "lurking", "chronology", "buffer", "rotten", "pre-heat", "performance", "showtime", "go fish", "boiled", "empty", "watchful", "restless", "goombeast", "trapped", "d3ath", "sloo", "man", "blunted", "unlikely-rivals", "death-battle", "death battle 2", "faz-fail", "blue buddies", "fazfuck news", "approaching", "jack in the box", "nightmare", "followed", "miller"]; //add songs in here

	var curSelection:Int = 0;
	var curDifficulty:Int = 0;

	var tape:FlxSprite;
	var tv:Tv;

	var arrow1:FlxText;
	var arrow2:FlxText;

	var interactable:Bool = true;
	var selectDiff:Bool = false;

	var curSprite:String;
	override function create() {
		
		Paths.clearStoredMemory();
		Paths.clearUnusedMemory();

		super.create();
		FlxG.camera.zoom = 1.07;

		tv = new Tv(9, 23.5);
		add(tv);

		tape = new FlxSprite(9, 23.5, Paths.image("freeplay/tapes-screen/tape"));
		add(tape);

		arrow1 = new FlxText(62, 550, 0, "<", 70);
		arrow1.font = Paths.font("vcr.ttf");
		add(arrow1);

		arrow2 = new FlxText(0, 550, 0, ">", 70);
		arrow2.x = 1280-arrow2.width-62;
		arrow2.font = Paths.font("vcr.ttf");
		add(arrow2);

		FlxTween.tween(arrow1, {x:42}, 1, {ease:FlxEase.sineInOut, type:PINGPONG});
		FlxTween.tween(arrow2, {x:1280-arrow2.width-42}, 1, {ease:FlxEase.sineInOut, type:PINGPONG});

		switchSelection(0);
		switchDifficulty(0);
	}

	override function update(elapsed:Float) {
		super.update(elapsed);
		if (interactable)
		{
			if (controls.UI_LEFT_P) switchSelection(-1);
			if (controls.UI_RIGHT_P) switchSelection(1);
			if (controls.ACCEPT) accept();
			if (controls.BACK)
				MusicBeatState.switchState(new MainMenuState());
		}
		if (selectDiff)
		{
			if (controls.UI_UP_P) switchDifficulty(-1);
			if (controls.UI_DOWN_P) switchDifficulty(1);
			if (controls.ACCEPT)
			{
				FlxTween.tween(tv, {y:135}, 5, {ease:FlxEase.sineIn});
				FlxTween.tween(FlxG.camera, {zoom:2}, 5, {ease:FlxEase.sineIn});
				tv.transitionIntoGame();

				new FlxTimer().start(3.5, function(e:FlxTimer)
				{
					var diffs:Array<String> = ["-cheesy", "-extra-cheesy"]; //Highscore and Coolutil keep returning Null soooo

					PlayState.SONG = Song.loadFromJson(songs[curSelection] + diffs[curDifficulty], songs[curSelection]);
					PlayState.campaignScore = 0;
					PlayState.campaignMisses = 0;
					PlayState.isStoryMode = false;

					LoadingState.loadAndSwitchState(new PlayState(), true);
				});
			}
			if (controls.BACK)
				back();
		}
	}

	function back()
	{
		selectDiff = false;
		FlxTween.tween(tv, {y:23.5}, 0.55, {ease:FlxEase.sineInOut, onComplete: function(e:FlxTween) interactable = true});
		FlxTween.tween(FlxG.camera, {zoom:1.07}, 0.5, {ease:FlxEase.sineInOut});

		FlxTween.tween(tape, {y:23.5}, 0.3, {ease:FlxEase.sineIn});
		FlxTween.tween(arrow1, {y:550}, 0.3, {ease:FlxEase.sineIn});
		FlxTween.tween(arrow2, {y:550}, 0.3, {ease:FlxEase.sineIn});
		tv.switchToSong();
	}

	function accept()
	{
		interactable = false;
		FlxTween.tween(tv, {y:110}, 0.55, {ease:FlxEase.sineInOut, onComplete: function(e:FlxTween) selectDiff = true});
		FlxTween.tween(FlxG.camera, {zoom:1.5}, 0.5, {ease:FlxEase.sineInOut});

		FlxTween.tween(tape, {y:150}, 0.3, {ease:FlxEase.sineIn});
		FlxTween.tween(arrow1, {y:720}, 0.3, {ease:FlxEase.sineIn});
		FlxTween.tween(arrow2, {y:720}, 0.3, {ease:FlxEase.sineIn});
		tv.switchToDiff();
	}

	function switchDifficulty(hit:Int) {
		curDifficulty += hit;

		if (curDifficulty < 0) curDifficulty = 0;
		if (curDifficulty > 1) curDifficulty = 1;

		tv.switchDiffInfo(curDifficulty);
	}

	function switchSelection(hit:Int) {
		interactable = false;
		curSelection += hit;

		if (curSelection < 0) curSelection = songs.length - 1;
		if (curSelection > songs.length - 1) curSelection = 0;

		var where = -1280;
		if (hit < 0) where = -where;

		curSprite = songs[curSelection];
		if (Reflect.field(FlxG.save.data, songToSaveData(songs[curSelection])) != "beaten") curSprite = "locked";

		FlxTween.tween(tape, {x: where}, 0.25, {ease:FlxEase.circIn, onComplete: function(e:FlxTween)
		{
			tape.x = -where;

			tape.loadGraphic(Paths.image("freeplay/tapes-screen/" + curSprite));
			FlxTween.tween(tape, {x: 9}, 0.25, {ease:FlxEase.circOut, onComplete: function(e:FlxTween) interactable = true});
		}});	

		tv.switchInfo(curSelection, curSprite.toUpperCase());
	}

	function songToSaveData(song:String):String
		return song.replace("-", "").toLowerCase() + "Lock";
}

class Tv extends FlxSpriteGroup{
	public var screen:FlxSprite;
	
	var scanline:FlxSprite;
	var vignette:FlxSprite;
	var staticFlick:FlxSprite;
	var info:FlxText;
	var diffInfo:FlxText;

	var visibility:Float = 1;

	public function new(X:Float = 0, Y:Float = 0)
	{
		super(X, Y);

		var black = new FlxSprite(0, 0, Paths.image("freeplay/black")); //the reason i didn't use makeGraphic is because im too lazy to do offsetting LOL
		add(black);

		diffInfo = new FlxText(450, 170, 0, "", 37);
		diffInfo.setBorderStyle(FlxTextBorderStyle.OUTLINE, 0xff000000, 2);
		diffInfo.font = Paths.font("vcr.ttf");

		var theroom = new FlxSprite(0, 0, Paths.image("freeplay/theroom"));
		add(theroom);

		screen = new FlxSprite(0, 0, Paths.image("freeplay/tapes-screen/guy-screen"));
		add(screen);

		staticFlick = new FlxSprite(0, 0);
		staticFlick.frames = Paths.getSparrowAtlas("freeplay/static");
		staticFlick.animation.addByPrefix("loop", "static", 30);
		staticFlick.animation.play("loop");
		staticFlick.alpha = 0;
		add(staticFlick);

		info = new FlxText(420, 70, 0, "", 37);
		info.color = 0xff51ff00;
		info.setBorderStyle(FlxTextBorderStyle.OUTLINE, 0xff000000, 2);
		info.font = Paths.font("vcr.ttf");
		add(info);

		scanline = new FlxSprite(0, 0 , Paths.image("freeplay/scanline"));
		add(scanline);
		
		var tv = new FlxSprite(0, 0 , Paths.image("freeplay/Tv"));
		add(tv);

		vignette = new FlxSprite(0, 0 , Paths.image("freeplay/gradientwow"));
		add(vignette);

	}

	override function update(elapsed:Float) {
		super.update(elapsed);
		
		visibility -= elapsed;
		if (visibility <= 0)
		{
			visibility = 1;
			info.visible = !info.visible;
		}
		scanline.alpha = FlxG.random.float(0.2, 0.3);
	}

	public function transitionIntoGame()
	{
		FlxTween.cancelTweensOf(staticFlick);
		FlxTween.tween(staticFlick, {alpha: 1}, 1.5);
		FlxTween.tween(diffInfo, {alpha: 0}, 1.5);
		FlxTween.tween(info, {alpha: 0}, 1.5);
	}

	public function switchDiffInfo(selection:Int)
	{
		var diffs:Array<String> = ["CHEESY", "EXTRA CHEESY"];
		diffs[selection] = ">" + diffs[selection];

		diffInfo.text = diffs.join("\n\n");
	}

	public function switchToSong()
	{
		info.alpha = 1;
		screen.alpha = 1;

		FlxTween.cancelTweensOf(staticFlick);
		FlxTween.tween(staticFlick, {alpha: 1}, 0.4, {type:BACKWARD});

		remove(diffInfo);
	}

	public function switchToDiff()
	{
		info.alpha = 0.2;
		screen.alpha = 0.2;

		FlxTween.cancelTweensOf(staticFlick);
		FlxTween.tween(staticFlick, {alpha: 1}, 0.4, {type:BACKWARD});
		add(diffInfo);
	}

	public function switchInfo(ch:Int, name:String)
	{
		ch += 1;
		var formatCh:String = Std.string(ch);
		if (ch < 10) formatCh = "0" + formatCh;

		info.text = "CH " + formatCh + "\n" + name;

		screen.loadGraphic(Paths.image("freeplay/tapes-screen/" + name.toLowerCase() + "-screen"));

		FlxTween.cancelTweensOf(staticFlick);
		FlxTween.tween(staticFlick, {alpha: 1}, 0.4, {type:BACKWARD});
	}
}
