package backend;



import psychlua.LuaUtils;
#if (FLX_DRAW_QUADS && !flash)
import flixel.graphics.tile.FlxGraphicsShader;


#if lime
import lime.utils.Float32Array;
#end
import openfl.display.BitmapData;
import openfl.display.ShaderInput;
import openfl.display.ShaderParameter;
import openfl.display.ShaderParameterType;
import flixel.addons.display.FlxRuntimeShader;

using StringTools;

class RuntimeShader extends FlxRuntimeShader
{


    var curClass:String = Type.getClassName(Type.getClass(MusicBeatState.currentState)); 
	
	public var tag:String = '';

	private var tweenMap:Map<String, FlxTween> = new Map();

	/**
	 * Tween a float parameter of the shader.
	 * @param name The name of the parameter to tween.
	 * @param toValue The new value to use.
	 * @param time time it takes to tween
	 * @param ease FlxEase to use
	 */
	public function tweenFloat(name:String, toValue:Float, time:Float, ease:String = ''):Void
	{
		//todo make this like actually good
		var prop:ShaderParameter<Float> = Reflect.field(this.data, name);
		
		if (prop == null)
		{
			trace('[WARN] Shader float property ${name} not found.');
			return;
		}
		if (prop.value == null) {
			setFloat(name,0);
			trace('[WARN] Shader float property ${name} not set. Setting to 0.');
			//return;
		}

		if (tweenMap.get(name) != null) {
			tweenMap.get(name).cancel();
			tweenMap.remove(name);
		}


		//weird as fuck way to go about it but it works lol?
		if (curClass.contains('.')) curClass = curClass.split('.').pop();
		if (curClass == 'PlayState') 
		{
			tweenMap.set(name,PlayState.instance.playStateTween.num(getFloat(name),toValue,time, {ease: LuaUtils.getTweenEaseByString(ease), onComplete: function (t:FlxTween) {
				tweenMap.remove(name);
			}}, function (f) {
				setFloat(name,f);
			})
			);
		}
		else 
		{
			tweenMap.set(name,FlxTween.num(getFloat(name),toValue,time, {ease: LuaUtils.getTweenEaseByString(ease), onComplete: function (t:FlxTween) {
				tweenMap.remove(name);
			}}, function (f) {
				setFloat(name,f);
			})
			);
		}


	}

	public var updateiTime(default,set):Bool = false;
	private var iTimeIndex:Int = -1;

	private function set_updateiTime(value:Bool):Bool //data todo make itime removable
	{
		if (value && ClientPrefs.data.shaders) {
			iTimeIndex = MusicBeatState.updateItime.push(this);
			return true;
		}
		else {
			if (iTimeIndex != -1) 
			{
				MusicBeatState.updateItime.splice(0,iTimeIndex);
			}
			return false;
		}

	}







}
#end