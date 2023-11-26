function onCreate()
	makeLuaSprite('blabble', 'UR/battle', 150, 350);
	setScrollFactor('blabble', 1, 1);
	scaleObject('blabble', 0.5, 0.5);

	makeLuaSprite('hp', 'UR/hp', 150, 300);
	setScrollFactor('hp', 1, 1);
	scaleObject('hp', 0.5, 0.5);

	makeLuaSprite('soul', 'UR/soul', 150, 350);
	setScrollFactor('soul', 1, 1);
	scaleObject('soul', 0.5, 0.5);

	makeAnimatedLuaSprite('t', 'UR/lightning', 1300, 350);
	addAnimationByPrefix('t', 'dance', 'zeus', 24, true);
	setLuaSpriteScrollFactor('t', 1, 1);
	scaleObject('t', 0.5, 0.5);

	makeLuaSprite('bg', 'UR/Bg', -75, 200);
	setScrollFactor('bg', 1, 1);
	scaleObject('bg', 0.5, 0.5);

	makeLuaSprite('tab', 'UR/table', -75, 200);
	setScrollFactor('tab', 1, 1);
	scaleObject('tab', 0.5, 0.5);
	setObjectOrder('tab', 10)

	addLuaSprite('blabble', false);
	addLuaSprite('hp', false);
	addLuaSprite('soul', false);
	addLuaSprite('t', false);
	addLuaSprite('bg', false);
	addLuaSprite('tab', false);
end

function onCountdownStarted()
	setProperty('gf.visible', false)
end

function onStepHit()
	if(curStep == 2064 and songName == "unlikely-rivals") then
		setProperty('bg.visible', false);
		setProperty('tab.visible', false);
      end
	if(curStep == 2320 and songName == "unlikely-rivals") then
		setProperty('bg.visible', true);
		setProperty('tab.visible', true);
    end
end