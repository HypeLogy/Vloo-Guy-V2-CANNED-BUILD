package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.addons.display.FlxTiledSprite;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Array<String>> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;
	var descBox:AttachedSprite;
	var checkerboard:FlxTiledSprite;

	var offsetThing:Float = -75;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		persistentUpdate = true;
		bg = new FlxSprite().loadGraphic(Paths.image('kitchencreds'));
		add(bg);
		bg.screenCenter();
		bg.scale.set(2.2, 2.2);

		checkerboard = new FlxTiledSprite(Paths.image('checkerboard'), FlxG.width * 3, FlxG.width * 3, true, true);
		checkerboard.scrollFactor.set(0, 0);
		checkerboard.x = -100;
		checkerboard.y = -100;
		checkerboard.antialiasing = false;
		add(checkerboard);
		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		var path:String = 'modsList.txt';
		if(FileSystem.exists(path))
		{
			var leMods:Array<String> = CoolUtil.coolTextFile(path);
			for (i in 0...leMods.length)
			{
				if(leMods.length > 1 && leMods[0].length > 0) {
					var modSplit:Array<String> = leMods[i].split('|');
					if(!Paths.ignoreModFolders.contains(modSplit[0].toLowerCase()) && !modsAdded.contains(modSplit[0]))
					{
						if(modSplit[1] == '1')
							pushModCreditsToList(modSplit[0]);
						else
							modsAdded.push(modSplit[0]);
					}
				}
			}
		}

		var arrayOfFolders:Array<String> = Paths.getModDirectories();
		arrayOfFolders.push('');
		for (folder in arrayOfFolders)
		{
			pushModCreditsToList(folder);
		}
		#end

		var pisspoop:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color
			['Vloo Guy Owners & Director'],
			['under',			'under',			'Mod Owner / Director, Lead Artist',							'https://twitter.com/UnderFanXD',		'B42F71'],
			['Smily',			'smily',			'Mod Owner / Director, Lead musician',							'https://www.youtube.com/@smilybruh3636',		'B42F71'],
			['Dogelord55',			'doge',			'Mod Owner / Director, Lead Coder, Charter, Semi-Musician\n thanks for getting me this far guys :)', 'https://twitter.com/dogelord55',		'B42F71'],
			['Hype Logy',			'Logy',			'Co-Director, Coder\nhey logy hows the background',							'https://twitter.com/HypeLogy2?t=nFphrTykVBCkjsGKulSCHQ&s=09',		'B42F71'],
			[''],
			['Vloo Guy Musicians'],
			['KOSE',			'Kose',			'Composer\nputang ina mo ',							'https://www.youtube.com/channel/UCyjxTiae27tTDGY7KqPykFg ',		'B42F71'],
			['Kat',			'Kat',			'Composed Boied with smily\n I eat balls for a living',							'https://twitter.com/Kat33157893',		'B42F71'],
			['Ari The When',			'Ari',			'Composed Buffer\nHUH',							'https://twitter.com/Ari_the_when',		'B42F71'],
			['Periodical', 'Peri', 'Composed DEATH BATTLE / Semi-Animator\nim hungry', 'https://twitter.com/galliumxenon', 'B42F71'],
			['Katabooz', 'katabooz', 'Composed Rotten', 'https://twitter.com/kataboozOFCL', 'B42F71'],
			['StemwareGV', 'stem', 'Composed Man\nAparte te odio porque tu juegas Ligofleyens. LIGOFLEYES, GORDO DE MIERDA', 'https://twitter.com/ThiagoMAcqua', 'B42F71'],
			['Clappers46', 'Clappers', 'Composed Sloo', 'https://twitter.com/Clappers46', 'B42F71'],
			['JPR',			'jpr',			'Musician\nGreen Hills', 'https://twitter.com/JPRxml',		'B42F71'],
			['Vloo Guy Artists'],
			['ConfidenceZERO',			'Confi',		'Artist\ni am going to explode',	'https://twitter.com/ConfidenceZ3R0',	'B42F71'],
			['Cyno', 'Ryhno', 'Artist ("i did the bf sprites for lurking (they old asf!!!!!2!1@!12)"\nhi yoisabo and cerulian and headdzo and aaron and deter', 'https://twitter.com/HumerlossMM69', 'B42F71'],
			['CommandBOSS', 'CommandBoss', 'Artist', 'Arse', 'https://twitter.com/CommandBOSS1', 'FFFFFF'],	
			['4rrth',			'4r',			'made sprites, bg and icons for blunted v-core\nglue guy my beloved',	'https://gamebanana.com/members/1767341',	'B42F71'],
			['Cory Hedgehog',			'cory',			'Artist\nI love bite',	'https://twitter.com/cory_hedgehog',	'B42F71'],
			['Dreupy', 'dreup', 'Artist / Charter', 'smalls boob are the best boobs', 'https://twitter.com/dreupy', 'FFFFFF'],
			['Hemp',			'hemp',			'Artist and Animator\nHUH',							'https://twitter.com/smokedhemp',		'B42F71'],
			['Aldox',			'aldox',		'Artist and Animator',	'https://twitter.com/SillyDilly1001',	'B42F71'],
			['zeb2',			'zeb',			'Artist and Animator\nzeb',							'https://twitter.com/Zeb109',		'B42F71'],
			['StoneSteve',			'Steve',			'Artist For Jotas sprite\nkiwiquest if you see this follow me on twitter my dream wil come true', 'https://twitter.com/stonesteves', 'B42F71'],
			['Gnet', 'Gnet', 'Artist For Noteskin / Title Effects', 'https://twitter.com/gnet_idiot', 'B42F71'],
			[''],
			['Vloo Guy Coders'],
			['Quackerona',			'quack',		'Coder\nbend',	'https://twitter.com/SillyDilly1001',	'B42F71'],
			['Dawn',			'Dawn',			'Coder / Charter\nsex is for losers, only real ones code vloo guy',							'https://twitter.com/DJDoesStuff_',		'B42F71'],
			['Jaro.hx',			'firis',			'coder\nUnder por la mierda dejame jugar el csgo',							'https://www.youtube.com/channel/UCbP94747E1d9wKNixSYwMtg',		'B42F71'],
			['Kn1ghtNight', 'kn1ght', 'Coder \n Shit yourself', 'https://twitter.com/FNCDCreator', 'B42F71'],
			['Comical Chaos',				'Comical',			"The coder that lives in your walls", 'https://twitter.com/Comical_Cha0s',	'B42F71'],
			['elfb34', 'elfb', 'helper coder\nsaludos a mi novia que la quiero mucho\nhttps://youtu.be/wmNkTDQQQIo', 'https://twitter.com/elfb344 ','B42F71'],
			['EcHO',			'echo',			'Helped with hotfix coding\nhi guys, look at me groove',							'https://twitter.com/EcHOhotperson',		'B42F71'],
			[],
			['Vloo Guy Charters'],
			['Junebug',			'june',		'Charter For: Midnight, Chronology, Rotten, Bite, Unlikely Rivals And Goombox\nYou know what they say!',	'https://twitter.com/junebug_7801',	'B42F71'],
			['kloogybaboogy',			'kloogy',		'Charter And Va',	'https://twitter.com/SillyDilly1001',	'B42F71'],
			['Mug',			'mug',			'Charter',							'https://www.youtube.com/@mug9660',		'B42F71'],
			['Fidy50', 'fid', 'Charter/Charter of Blunted, Unlikely Rivals (Extra Cheesy), Sloo  (Extra Cheesy), Chronology  (Extra Cheesy)\nVloo Guy, more like Poo Guy XD', 'https://twitter.com/50Fidy', 'B42F71'],
			[''],
			['Vloo Guy Animators'],
			['Oodles', 'oodles', 'Animator for midnight, blubber, performance (partially), golden, guy, mushroom animation thing in chronology, lurking, and beatbox\ndabandav is the stinkiest man i’ve ever met /j', 'https://twitter.com/Oodles_Guy', 'B42F71'],
			['BillionSwing',			'Alt_Twitter',		'animator',	'https://twitter.com/Billion_Swing',	'B42F71'],
			['Bruno', 'bruno', 'art / animation\nGren is better than Vloo >:)', 'https://twitter.com/BrunoAaAaAa', 'B42F71'],
			['Foocan', 'foocan', 'animator\nI animated everything and nobody can tell me otherwise :torl:', 'https://twitter.com/foocans', 'B42F71'],
			[''],
			['Special Thanks & Misc'],
			['Dem', 'dem', 'Chromatic Maker\nMOMAZOS DIEGO', 'https://www.youtube.com/channel/UClGtPlHKluZv0moC_NWcV_w', 'B42F71'],
			['Blu',			'blu',			'SFX\nyuno miles my goat',							'',		'B42F71'],
			['Caz', 'caz', 'Concept Artist / Emotional Support for Doge :)\nThe clown who smiles back', 'https://twitter.com/caz_arc', 'B42F71'],
			['ParkerPantz', 'parker', 'Ged Boy\nOh my god i cant believe im in vloo guy!!!', 'https://twitter.com/ParkerPantz8', 'B42F71'],
			['KiwiQuest',			'sherri',			'created ourple guy, made the menu music and discord rpc main art',	'https://twitter.com/kiwiquestt',	'B42F71'],
			['Deacon',			'ceru',			'let us use the bf and gf d-sides og asset',	'https://twitter.com/DastardlyDeacon',	'B42F71'],
			[''],
			['Psych Engine Team'],
			['RiverOaken',			'river',			'Main Artist/Animator of Psych Engine',							'https://twitter.com/RiverOaken',		'B42F71'],
			['shubs',				'shubs',			'Additional Programmer of Psych Engine',						'https://twitter.com/yoshubs',			'B42F71'],
			[''],
			['Former Engine Members'],
			['bb-panzu',			'bb',				'Ex-Programmer of Psych Engine',								'https://twitter.com/bbsub3',			'B42F71'],
			[''],
			['Engine Contributors'],
			['iFlicky',				'flicky',			'Composer of Psync and Tea Time\nMade the Dialogue Sounds',		'https://twitter.com/flicky_i',			'B42F71'],
			['SqirraRNG',			'sqirra',			'Crash Handler and Base code for\nChart Editor\'s Waveform',	'https://twitter.com/gedehari',			'B42F71'],
			['EliteMasterEric',		'mastereric',		'Runtime Shaders support',										'https://twitter.com/EliteMasterEric',	'B42F71'],
			['PolybiusProxy',		'proxy',			'.MP4 Video Loader Library (hxCodec)',							'https://twitter.com/polybiusproxy',	'B42F71'],
			['KadeDev',				'kade',				'Fixed some cool stuff on Chart Editor\nand other PRs',			'https://twitter.com/kade0912',			'B42F71'],
			['Keoiki',				'keoiki',			'Note Splash Animations',										'https://twitter.com/Keoiki_',			'B42F71'],
			['Nebula the Zorua',	'nebula',			'LUA JIT Fork and some Lua reworks',							'https://twitter.com/Nebula_Zorua',		'B42F71'],
			['Smokey',				'smokey',			'Sprite Atlas Support',											'https://twitter.com/Smokey_5_',		'B42F71'],
			[''],
			["Funkin' Crew"],
			['ninjamuffin99',		'ninjamuffin99',	"Programmer of Friday Night Funkin'",							'https://twitter.com/ninja_muffin99',	'B42F71'],
			['PhantomArcade',		'phantomarcade',	"Animator of Friday Night Funkin'",								'https://twitter.com/PhantomArcade3K',	'B42F71'],
			['evilsk8r',			'evilsk8r',			"Artist of Friday Night Funkin'",								'https://twitter.com/evilsk8r',			'B42F71'],
			['kawaisprite',			'kawaisprite',		"Composer of Friday Night Funkin'",								'https://twitter.com/kawaisprite',		'B42F71']
		];
		
		for(i in pisspoop){
			creditsStuff.push(i);
		}
	
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(FlxG.width / 2, 300, creditsStuff[i][0], !isSelectable);
			optionText.isMenuItem = true;
			optionText.targetY = i;
			optionText.changeX = false;
			optionText.snapToPosition();
			grpOptions.add(optionText);

			if(isSelectable) {
				if(creditsStuff[i][5] != null)
				{
					Paths.currentModDirectory = creditsStuff[i][5];
				}

				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
				Paths.currentModDirectory = '';

				if(curSelected == -1) curSelected = i;
			}
			else optionText.alignment = CENTERED;
		}
		
		descBox = new AttachedSprite();
		descBox.makeGraphic(1, 1, FlxColor.BLACK);
		descBox.xAdd = -10;
		descBox.yAdd = -10;
		descBox.alphaMult = 0.6;
		descBox.alpha = 0.6;
		add(descBox);

		descText = new FlxText(50, FlxG.height + offsetThing - 25, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		//descText.borderSize = 2.4;
		descBox.sprTracker = descText;
		add(descText);

		bg.color = getCurrentBGColor();
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	var quitting:Bool = false;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if(!quitting)
		{
			if(creditsStuff.length > 1)
			{
				var shiftMult:Int = 1;
				if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

				var upP = controls.UI_UP_P;
				var downP = controls.UI_DOWN_P;

				if (upP)
				{
					changeSelection(-shiftMult);
					holdTime = 0;
				}
				if (downP)
				{
					changeSelection(shiftMult);
					holdTime = 0;
				}
				{
					checkerboard.scrollX += 1 * 25 * elapsed;
					checkerboard.scrollY -= 1 * 25 * elapsed;
				}
				if(controls.UI_DOWN || controls.UI_UP)
				{
					var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
					holdTime += elapsed;
					var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

					if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
					{
						changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
					}
				}
			}

			if(controls.ACCEPT && (creditsStuff[curSelected][3] == null || creditsStuff[curSelected][3].length > 4)) {
				CoolUtil.browserLoad(creditsStuff[curSelected][3]);
			}
			if (controls.BACK)
			{
				if(colorTween != null) {
					colorTween.cancel();
				}
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new MainMenuState());
				quitting = true;
			}
		}
		
		for (item in grpOptions.members)
		{
			if(!item.bold)
			{
				var lerpVal:Float = CoolUtil.boundTo(elapsed * 12, 0, 1);
				if(item.targetY == 0)
				{
					var lastX:Float = item.x;
					item.screenCenter(X);
					item.x = FlxMath.lerp(lastX, item.x - 70, lerpVal);
				}
				else
				{
					item.x = FlxMath.lerp(item.x, 200 + -40 * Math.abs(item.targetY), lerpVal);
				}
			}
		}
		super.update(elapsed);
	}

	var moveTween:FlxTween = null;
	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:Int =  getCurrentBGColor();
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}

		descText.text = creditsStuff[curSelected][2];
		descText.y = FlxG.height - descText.height + offsetThing - 60;

		if(moveTween != null) moveTween.cancel();
		moveTween = FlxTween.tween(descText, {y : descText.y + 75}, 0.25, {ease: FlxEase.sineOut});

		descBox.setGraphicSize(Std.int(descText.width + 20), Std.int(descText.height + 25));
		descBox.updateHitbox();
	}

	#if MODS_ALLOWED
	private var modsAdded:Array<String> = [];
	function pushModCreditsToList(folder:String)
	{
		if(modsAdded.contains(folder)) return;

		var creditsFile:String = null;
		if(folder != null && folder.trim().length > 0) creditsFile = Paths.mods(folder + '/data/credits.txt');
		else creditsFile = Paths.mods('data/credits.txt');

		if (FileSystem.exists(creditsFile))
		{
			var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
			for(i in firstarray)
			{
				var arr:Array<String> = i.replace('\\n', '\n').split("::");
				if(arr.length >= 5) arr.push(folder);
				creditsStuff.push(arr);
			}
			creditsStuff.push(['']);
		}
		modsAdded.push(folder);
	}
	#end

	function getCurrentBGColor() {
		var bgColor:String = creditsStuff[curSelected][4];
		if(!bgColor.startsWith('0x')) {
			bgColor = '0xFF' + bgColor;
		}
		return Std.parseInt(bgColor);
	}

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}