package backend;

import flixel.util.FlxAxes;

// datas beautiful static extensions
class FlxObjectTools
{
	//not correct term to call it but idk what else 
	static inline public function setGraphic(sprite:FlxSprite, width:Float,height:Float,color:FlxColor = FlxColor.WHITE):FlxSprite
	{
		sprite.makeGraphic(1,1,color);
		sprite.setGraphicSize(width,height);
		sprite.updateHitbox();
		return sprite;
	}
	static inline public function loadImage(sprite:FlxSprite, image:String, lib:Null<String> = null):FlxSprite
	{
		return sprite.loadGraphic(Paths.image(image, lib));
	}

    static inline public function loadFrames(sprite:FlxSprite, image:String, lib:Null<String> = null):FlxSprite
    {
        sprite.frames = Paths.getSparrowAtlas(image,lib);
        return sprite;
    }

	static inline public function setScale(sprite:FlxSprite, scaleX:Float, ?scaleY:Null<Float> = null, ?updatehitbox = true):FlxSprite
	{
        scaleY ??= scaleX;
		sprite.scale.set(scaleX, scaleY);
		if (updatehitbox)
			sprite.updateHitbox();
		return sprite;
	}

	static inline public function centerOnSprite(sprite:FlxSprite, spr:FlxSprite, axes:FlxAxes = XY):FlxSprite
	{
		if (axes.x)
			sprite.x = spr.x + (spr.width - sprite.width) / 2;

		if (axes.y)
			sprite.y = spr.y + (spr.height - sprite.height) / 2;

		return sprite;
	}

}
