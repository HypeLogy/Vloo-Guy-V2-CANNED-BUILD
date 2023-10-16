package;

import flixel.FlxSprite;
import openfl.utils.Assets as OpenFlAssets;

using StringTools;

class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false)
		{
			super();
			switch(char)
			{
				case 'vlooguy':
					loadGraphic(Paths.image('icons/icon-vloo'), true, 150, 150);
	
					antialiasing = true;
					animation.addByPrefix('n', 'n', 24, true, isPlayer);
					animation.addByPrefix('l', 'l', 24, true, isPlayer);
					animation.addByPrefix('guh', 'guh', 24, true, isPlayer);
				case 'yed':
					loadGraphic(Paths.image('icons/icon-yed'), true, 150, 150);
	
					antialiasing = true;
					animation.addByPrefix('n', 'n', 24, true, isPlayer);
					animation.addByPrefix('l', 'l', 24, true, isPlayer);
					animation.addByPrefix('guh', 'guh', 24, true, isPlayer);
				case 'sloo':
					loadGraphic(Paths.image('icons/icon-ketchup'), true, 150, 150);
	
					antialiasing = true;
					animation.addByPrefix('n', 'n', 24, true, isPlayer);
					animation.addByPrefix('l', 'l', 24, true, isPlayer);
					animation.addByPrefix('guh', 'guh', 24, true, isPlayer);
				case 'bfvloo':
					loadGraphic(Paths.image('icons/icon-bbf'), true, 150, 150);
			
					antialiasing = true;
					animation.addByPrefix('n', 'n', 24, true, isPlayer);
					animation.addByPrefix('l', 'l', 24, true, isPlayer);
					animation.addByPrefix('guh', 'guh', 24, true, isPlayer);
			}
			animation.play('n');
			antialiasing = ClientPrefs.globalAntialiasing;
			scrollFactor.set();
		}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (healthBar.percent < 20)
			

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}