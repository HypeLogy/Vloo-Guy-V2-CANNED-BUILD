package backend;

import flixel.addons.display.FlxRuntimeShader;

class RuntimeShader extends FlxRuntimeShader
{


    
	public var tag:String = '';

	var curClass:String = Type.getClassName(Type.getClass(MusicBeatState.currentState)); //i tried doing curclass is playstate but it wouldnt work? so ig a string
	
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
		if (prop == null || prop.value.length == 0)
		{
			trace('[WARN] Shader float property ${name} not found.');
			return;
		}

		if (tweenMap.get(name) != null) {
			tweenMap.get(name).cancel();
			tweenMap.remove(name);
			setFloat(name,toValue);
		}


		if (curClass == 'PlayState') {
			tweenMap.set(name,PlayState.instance.eventTweens.num(getFloat(name),toValue,time, {ease: FunkinLua.getFlxEaseByString(ease), onComplete: function (t:FlxTween) {
				tweenMap.remove(name);
			}}, function (f) {
				setFloat(name,f);
			})
			);
		}
		else {
			tweenMap.set(name,FlxTween.num(getFloat(name),toValue,time, {ease: FunkinLua.getFlxEaseByString(ease), onComplete: function (t:FlxTween) {
				tweenMap.remove(name);
			}}, function (f) {
				setFloat(name,f);
			})
			);
		}


	}

	// public var updateiTime(default,set):Bool = false;
	// private var iTimeIndex:Int = -1;

	// private function set_updateiTime(value:Bool):Bool //data todo make itime removable
	// {
	// 	if (value && ClientPrefs.shaders) {
	// 		iTimeIndex = MusicBeatState.updateItime.push(this);
	// 		trace(iTimeIndex + 'iTIme!!!ADD');
			
	// 		return true;
	// 	}
	// 	else {
			
	// 		if (iTimeIndex != -1) {
	// 			MusicBeatState.updateItime.splice(0,iTimeIndex);

	// 		}

	// 		return false;
	// 	}

	// }







}
