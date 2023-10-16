package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;
import flixel.addons.display.FlxTiledSprite;
import flixel.util.FlxTimer;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.6.3'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	var checkerboard:FlxTiledSprite;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;	

	var guys:FlxTypedGroup<FlxSprite> = new FlxTypedGroup();
	var optionShit:Array<String> = [
		'play',
		'fp',
		'cred',
		'opt',
		'exit',
	];

	var squares:FlxSprite;
	var diamond:FlxSprite;
	var menubars_top:FlxTiledSprite;
	var menubars_bottom:FlxTiledSprite;
	var magenta:FlxSprite;
	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var debugKeys:Array<FlxKey>;
	var groupChars:FlxSprite;
	var arrow:FlxSprite;

	override function create()
	{
		Paths.clearStoredMemory();
		Paths.clearUnusedMemory();
		
		Conductor.changeBPM(99);
		#if MODS_ALLOWED
		Paths.pushGlobalMods();
		#end
		WeekData.loadTheFirstEnabledMod();

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement, false);
		FlxG.cameras.setDefaultDrawTarget(camGame, true);

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.set(0, yScroll);
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		checkerboard = new FlxTiledSprite(Paths.image('checkerboard'), FlxG.width * 3, FlxG.width * 3, true, true);
		checkerboard.scrollFactor.set(0, 0);
		checkerboard.x = -100;
		checkerboard.y = -100;
		checkerboard.antialiasing = false;
		add(checkerboard);

		menubars_top = new FlxTiledSprite(Paths.image('menubars'), FlxG.width * 3, FlxG.width * 3, true, false);
		menubars_top.scrollFactor.set(0, 0);
		menubars_top.antialiasing = false;
		add(menubars_top);

		menubars_bottom = new FlxTiledSprite(Paths.image('menubarsflip'), FlxG.width * 3, FlxG.width * 3, true, false);
		menubars_bottom.scrollFactor.set(0, 0);
		menubars_bottom.y = FlxG.height - 130;
		menubars_bottom.antialiasing = false;
		add(menubars_bottom);

		//
		var vloo = new FlxSprite(700, 100);
		vloo.frames = Paths.getSparrowAtlas('mainmenu/characters/vloomenuthing');
		vloo.animation.addByPrefix('dancey', 'vloomenuthing', 12, true); // halfing because hes so fucking fast
		vloo.animation.play('dancey', true);
		vloo.scrollFactor.set(0,0);
		vloo.updateHitbox();
		vloo.antialiasing = ClientPrefs.globalAntialiasing;
		guys.add(vloo);

		var yed = new FlxSprite(675, 50);
		yed.frames = Paths.getSparrowAtlas('mainmenu/characters/yedmenuthing');
		yed.animation.addByPrefix('dancey', 'yedmenuthing', 12, true); // halfing because hes so fucking fast
		yed.animation.play('dancey', true);
		yed.scrollFactor.set(0,0);
		yed.updateHitbox();
		yed.antialiasing = ClientPrefs.globalAntialiasing;
		guys.add(yed);

		var hank = new FlxSprite(550, 75);
		hank.frames = Paths.getSparrowAtlas('mainmenu/characters/hankmenuthing');
		hank.animation.addByPrefix('dancey', 'hankmenuthing', 12, true); // halfing because hes so fucking fast
		hank.animation.play('dancey', true);
		hank.scrollFactor.set(0,0);
		hank.updateHitbox();
		hank.antialiasing = ClientPrefs.globalAntialiasing;
		guys.add(hank);

		var mike = new FlxSprite(550, 75);
		mike.frames = Paths.getSparrowAtlas('mainmenu/characters/mikemenuthing');
		mike.animation.addByPrefix('dancey', 'mikemenuthing', 12, true); // halfing because hes so fucking fast
		mike.animation.play('dancey', true);
		mike.scrollFactor.set(0,0);
		mike.updateHitbox();
		mike.antialiasing = ClientPrefs.globalAntialiasing;
		guys.add(mike);

		var vloo2 = new FlxSprite(700, 150);
		vloo2.frames = Paths.getSparrowAtlas('mainmenu/characters/littlevloothing');
		vloo2.animation.addByPrefix('dancey', 'littlevloodance', 12, true); // halfing because hes so fucking fast
		vloo2.animation.play('dancey', true);
		vloo2.scrollFactor.set(0,0);
		vloo2.updateHitbox();
		vloo2.antialiasing = ClientPrefs.globalAntialiasing;
		guys.add(vloo2);
		//
		add(guys);

		diamond = new FlxSprite(0, -75).loadGraphic(Paths.image('menudiamond'));
		diamond.scrollFactor.set(0,0);
		diamond.updateHitbox();
		diamond.antialiasing = ClientPrefs.globalAntialiasing;
		diamond.scale.set(0.6, 0.6);
		add(diamond);

		squares = new FlxSprite(0, 0).loadGraphic(Paths.image('menusquares'));
		squares.scrollFactor.set(0,0);
		squares.updateHitbox();
		squares.antialiasing = ClientPrefs.globalAntialiasing;
		add(squares);
		
		FlxG.mouse.visible = true;

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;

		for (i in 0...optionShit.length)
			{
				var offset:Float = 215 - (Math.max(optionShit.length, 4) - 4);
				var menuItem:FlxSprite = new FlxSprite(0, (i * 140)  + offset);
				menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
				menuItem.animation.addByPrefix('idle', optionShit[i] + " " + optionShit[i], 23);
				menuItem.animation.play('idle');
				menuItem.scale.set(0.6, 0.6);
				menuItem.x = 100;
				menuItem.y = -600;
				menuItem.ID = i;
				menuItems.add(menuItem);
				var scr:Float = (optionShit.length - 4) * 0.135;
				if(optionShit.length < 6) scr = 0;
				menuItem.scrollFactor.set(0, scr);
				menuItem.antialiasing = ClientPrefs.globalAntialiasing;
				//menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
				switch (i)
					{
						case 0:
							menuItem.y = 152;
							menuItem.x = 275;
						case 1:
							menuItem.y = 225;
							menuItem.x = 298;
	
						case 2:
							menuItem.y = 298;
							menuItem.x = 320;
						
						case 3:
							menuItem.y = 358;
							menuItem.x = 340;
							
						case 4:
							menuItem.y = 432;
							menuItem.x = 363;
					}
		}

		arrow = new FlxSprite(450, 122).loadGraphic(Paths.image('vincearrow'));
		arrow.scrollFactor.set(0,0);
		arrow.scale.set(0.6, 0.6);
		arrow.updateHitbox();
		arrow.antialiasing = ClientPrefs.globalAntialiasing;
		add(arrow);
		

		var versionShit:FlxText = new FlxText(12, FlxG.height - 64, 0, "Psych Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Vs. Vloo Guy v1.8");
		versionShit.scrollFactor.set();
		versionShit.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		
		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18) {
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

		super.create();
		updateCurChar();
	}

	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement() {
		add(new AchievementObject('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "friday_night_play"');
	}
	#end

	var selectedSomethin:Bool = false;
	var oldPos = FlxG.mouse.getScreenPosition();

	override function update(elapsed:Float)
	{	
			
			switch (curSelected)//do not do that else if statement again. -Kn1ghtNight
			{
				case 0:
				  arrow.y = 122;
				  arrow.x = 450;
				case 1:
				  arrow.x = 470;
				  arrow.y = 200;
				case 2:
				  arrow.x = 485;
				  arrow.y = 260;
				case 3:
				  arrow.x = 495;
				  arrow.y = 320;
				case 4:
				  arrow.x = 510;
				  arrow.y = 400;
			}

			if (FlxG.sound.music.volume < 0.8)
			{
				FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
			}

			// I DONT HAVE TO USE THIS SHIT ASS CODE ANYMORE :manbreakingfreefromchains:
			/* if ((FlxG.mouse.getScreenPosition().x != oldPos.x || FlxG.mouse.getScreenPosition().y != oldPos.y) && !selectedSomethin)//me when me uhh
				{
					oldPos = FlxG.mouse.getScreenPosition();
					for (i in 0...menuItems.length)
					{
						if (FlxG.mouse.overlaps(menuItems.members[i]))
						{
							var pos = FlxG.mouse.getPositionInCameraView(FlxG.camera);
							if (pos.y > i / menuItems.length * FlxG.height && pos.y < (i + 1) / menuItems.length * FlxG.height && curSelected != i)
							{
								curSelected = i;
								FlxG.sound.play(Paths.sound('scrollMenu'));
								changeItem();
								break;
							}
						}
					}
				}
			*/
			
			menubars_top.scrollX -= 1 * 60 * elapsed;
			menubars_bottom.scrollX += 1 * 60 * elapsed;

			checkerboard.scrollX += 1 * 25 * elapsed;
			checkerboard.scrollY -= 1 * 25 * elapsed;

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);

		if (!selectedSomethin)
		{
			// welcome back mario
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
				updateCurChar();
			}
	
			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
				updateCurChar();
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxG.sound.music.fadeOut(1);
				MusicBeatState.switchState(new TitleState());
				FlxG.sound.playMusic(Paths.music('TitleScreen'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.7);
			}

			if (controls.ACCEPT)
			{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'play':
										PlayState.storyPlaylist = ['guy', 'midnight'];
										PlayState.isStoryMode = true;
										PlayState.SONG = Song.loadFromJson('guy-cheesy', 'guy');
										PlayState.storyWeek = 1;
										new FlxTimer().start(0.1, function(tmr:FlxTimer)
										{
											LoadingState.loadAndSwitchState(new PlayState(), true);
										});
									case 'fp':
										MusicBeatState.switchState(new FreeplayState());
									case 'cred':
										MusicBeatState.switchState(new CreditsState());
									case 'opt':
										LoadingState.loadAndSwitchState(new options.OptionsState());
									case 'exit':
										var rouletteText:String = FlxG.random.int(0, 2) == 0 ? 'https://www.youtube.com/watch?v=dQw4w9WgXcQ' : 'https://gamejolt.com/games/lockedsewer/796415' ; // i hate myself -Kn1ghtNight
										FlxG.openURL(rouletteText);
										Sys.exit(1);
								}
							});
						}
					});
			}
			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeys))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		super.update(elapsed);
	}

	override function beatHit() // eheehe vloo boucn :3
	{                           // No.
		super.beatHit();
		danceOnBeat();
	}

	function danceOnBeat()
	{
		guys.forEach(function(guy:FlxSprite)
		{
			guy.animation.play("dancey", true);
		});
	}

	function updateCurChar()
	{
		guys.forEach(function(guy:FlxSprite)
		{
			guy.visible = false;
		});

		guys.members[curSelected].visible = true;
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();

			trace(curSelected);

			if (spr.ID == curSelected)
			{
				var add:Float = 0;
				if(menuItems.length > 4) {
					add = menuItems.length * 8;
				}
				spr.centerOffsets();
			}
		});
	}
}
