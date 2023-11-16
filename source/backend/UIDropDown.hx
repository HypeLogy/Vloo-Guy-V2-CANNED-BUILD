package backend;

import flixel.addons.ui.FlxUIDropDownMenu;
import flixel.addons.ui.StrNameLabel;
import flixel.addons.ui.FlxUI;
import flixel.addons.ui.FlxUIButton;

class UIDropDown extends FlxUIDropDownMenu
{
	public var canScroll:Bool = true;

	private var currentScroll:Int = 0; // Handles the scrolling

	public var _dropDirection(default, set):FlxUIDropDownMenuDropDirection = Down;

	override private function dropsUp():Bool
	{
		return _dropDirection == Up || (_dropDirection == Automatic && exceedsHeight());
	}

	private function set__dropDirection(dropDirection):FlxUIDropDownMenuDropDirection
	{
		this.dropDirection = dropDirection;
		updateButtonPositions();
		return dropDirection;
	}

	public override function update(elapsed:Float):Void
	{
		super.update(elapsed);

		#if FLX_MOUSE
		if (dropPanel.visible)
		{
			if (list.length > 1 && canScroll)
			{
				if (FlxG.mouse.wheel > 0 || FlxG.keys.justPressed.UP)
				{
					// Go up
					--currentScroll;
					if (currentScroll < 0)
						currentScroll = 0;
					updateButtonPositions();
				}
				else if (FlxG.mouse.wheel < 0 || FlxG.keys.justPressed.DOWN)
				{
					// Go down
					currentScroll++;
					if (currentScroll >= list.length)
						currentScroll = list.length - 1;
					updateButtonPositions();
				}
			}

			if (FlxG.mouse.justPressed && !mouseOverlapping())
			{
				showList(false);
			}
		}
		#end
	}

	/**
	 * Helper function to easily create a data list for a dropdown menu from an array of strings.
	 *
	 * @param	StringArray		The strings to use as data - used for both label and string ID.
	 * @param	UseIndexID		Whether to use the integer index of the current string as ID.
	 * @return	The StrIDLabel array ready to be used in FlxUIDropDownMenu's constructor
	 */
	public static function makeStrIdLabelArray(StringArray:Array<String>, UseIndexID:Bool = false):Array<StrNameLabel>
	{
		var strIdArray:Array<StrNameLabel> = [];
		for (i in 0...StringArray.length)
		{
			var ID:String = StringArray[i];
			if (UseIndexID)
			{
				ID = Std.string(i);
			}
			strIdArray[i] = new StrNameLabel(ID, StringArray[i]);
		}
		return strIdArray;
	}

	function mouseOverlapping()
	{
		var mousePoint = FlxG.mouse.getScreenPosition(camera);
		var objPoint = this.getScreenPosition(null, camera);
		if (mousePoint.x >= objPoint.x
			&& mousePoint.y >= objPoint.y
			&& mousePoint.x < objPoint.x + this.width
			&& mousePoint.y < objPoint.y + this.height)
		{
			return true;
		}
		return false;
	}

	override private function showList(b:Bool):Void
	{
		for (button in list)
		{
			button.visible = b;
			button.active = b;
		}

		dropPanel.visible = b;
		if (currentScroll != 0)
		{
			currentScroll = 0;
			updateButtonPositions();
		}

		FlxUI.forceFocus(b, this); // avoid overlaps
	}

	override private function updateButtonPositions():Void
	{
		var buttonHeight = header.background.height;
		dropPanel.y = header.background.y;
		if (dropsUp())
			dropPanel.y -= getPanelHeight();
		else
			dropPanel.y += buttonHeight;

		var offset = dropPanel.y;
		for (i in 0...currentScroll)
		{ // Hides buttons that goes before the current scroll
			var button:FlxUIButton = list[i];
			if (button != null)
			{
				button.y = -99999;
			}
		}
		for (i in currentScroll...list.length)
		{
			var button:FlxUIButton = list[i];
			if (button != null)
			{
				button.y = offset;
				offset += buttonHeight;
			}
		}
	}
}
