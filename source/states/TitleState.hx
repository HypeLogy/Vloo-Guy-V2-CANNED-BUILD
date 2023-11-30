package states;

import backend.WeekData;
import backend.Highscore;

import flixel.input.keyboard.FlxKey;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.frames.FlxFrame;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import haxe.Json;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;

import shaders.ColorSwap;

import states.StoryMenuState;
import states.OutdatedState;
import states.MainMenuState;

typedef TitleData =
{
	titlex:Float,
	titley:Float,
	startx:Float,
	starty:Float,
	gfx:Float,
	gfy:Float,
	backgroundSprite:String,
	bpm:Float
}

class TitleState extends MusicBeatState
{
	public static var muteKeys:Array<FlxKey> = [FlxKey.ZERO];
	public static var volumeDownKeys:Array<FlxKey> = [FlxKey.NUMPADMINUS, FlxKey.MINUS];
	public static var volumeUpKeys:Array<FlxKey> = [FlxKey.NUMPADPLUS, FlxKey.PLUS];

	public static var initialized:Bool = false;

	public static var updateVersion:String = '';

	override public function create():Void
	{
		Paths.clearStoredMemory();

		#if LUA_ALLOWED
		Mods.pushGlobalMods();
		#end
		Mods.loadTopMod();

		//FlxG.fixedTimestep = false;
		FlxG.game.focusLostFramerate = 60;
		FlxG.keys.preventDefaultKeys = [TAB];

		super.create();

		FlxG.save.bind('funkin', CoolUtil.getSavePath());

		ClientPrefs.loadPrefs();

		Highscore.load();


		if(!initialized)
		{
			if(FlxG.save.data != null && FlxG.save.data.fullscreen)
			{
				FlxG.fullscreen = FlxG.save.data.fullscreen;
				//trace('LOADED FULLSCREEN SETTING!!');
			}
			FlxG.signals.preStateSwitch.add(MusicBeatState.clearShaderData);
			persistentUpdate = true;
			persistentDraw = true;
		}

		if (FlxG.save.data.weekCompleted != null)
		{
			StoryMenuState.weekCompleted = FlxG.save.data.weekCompleted;
		}

		FlxG.mouse.visible = false;

		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			startIntro();
		});

	}

	var logoBl:FlxSprite;

	function startIntro()
	{
		// if (!initialized)
		// {
		// 	if(FlxG.sound.music == null) {

		// 	}
		// }
		FlxG.sound.playMusic(Paths.music('TitleScreen'), 0);
		FlxG.sound.music.fadeIn(3);
		
		Conductor.bpm = 104;
		persistentUpdate = true;

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		logoBl = new FlxSprite(-250,-280).loadFrames('title/vloologo');
		logoBl.animation.addByIndices('bump','i',[3,2,1,0],'',12,false);
		logoBl.animation.play('bump');
		logoBl.setScale(2);
		add(logoBl);

		var vloo = new FlxSprite(0,30).loadImage('title/vloe');
		vloo.setScale(4);
		vloo.x = FlxG.width - vloo.width;
		add(vloo);



		var static1 = new FlxSprite().loadFrames('title/vloo_static');
		static1.animation.addByPrefix('i','scallywags instance 1');
		static1.animation.play('i');
		static1.blend = ADD;
		add(static1);

		var fade = new FlxSprite().makeGraphic(FlxG.width,FlxG.height,FlxColor.BLACK);
		add(fade);
		FlxTween.tween(fade, {alpha: 0},3, {onComplete: Void -> {
			fade.destroy();
		}});



		initialized = true;

		Paths.clearUnusedMemory();
	}

	var transitioning:Bool = false;
	private static var playJingle:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;
		// FlxG.watch.addQuick('amp', FlxG.sound.music.amplitude);

		var pressedEnter:Bool = FlxG.keys.justPressed.ENTER || controls.ACCEPT;

		#if mobile
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				pressedEnter = true;
			}
		}
		#end

		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

		if (gamepad != null)
		{
			if (gamepad.justPressed.START)
				pressedEnter = true;

			#if switch
			if (gamepad.justPressed.B)
				pressedEnter = true;
			#end
		}

		// EASTER EGG

		if (initialized && !transitioning)
		{			
			if(pressedEnter)
			{


				FlxG.camera.flash(ClientPrefs.data.flashing ? FlxColor.WHITE : 0x4CFFFFFF, 1);
				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);

				transitioning = true;

				new FlxTimer().start(1, function(tmr:FlxTimer)
				{

					MusicBeatState.switchState(new MainMenuState());
			
					closedState = true;
				});
				// FlxG.sound.play(Paths.music('titleShoot'), 0.7);
			}
			
		}




		super.update(elapsed);
	}

	private var sickBeats:Int = 0; //Basically curBeat but won't be skipped if you hold the tab or resize the screen
	public static var closedState:Bool = false;
	override function beatHit()
	{
		super.beatHit();

		if(logoBl != null)
			logoBl.animation.play('bump', true);

	}

	var increaseVolume:Bool = false;
}
