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

//WIP next thing to do is add tween options
class RuntimeShader extends FlxRuntimeShader
{


    var curClass:String = Type.getClassName(Type.getClass(MusicBeatState.currentState)); 
	var curState:Dynamic;
	
	
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

		curState = Type.resolveClass(curClass);
		//basically a thing to check if the current state its being used in has instancetween. basically is a tweenmanager that
		//is tied to whatever the state has setup
		//so in this case PlayState instanceTween is set to pause whenever u pause
		if (curState.instance.instanceTween != null) 
		{
			tweenMap.set(name,curState.instance.instanceTween.num(getFloat(name),toValue,time, {ease: LuaUtils.getTweenEaseByString(ease), onComplete: function (t:FlxTween) {
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

	private function set_updateiTime(value:Bool):Bool //data todo make this better
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