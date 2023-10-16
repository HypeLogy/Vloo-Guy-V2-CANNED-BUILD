function onCreate()
	makeLuaSprite('back', 'nightwatch/bg', -1300, -1050);
	setScrollFactor('back', 1, 1);
	scaleObject('back', 4, 4);
      setProperty('back.antialiasing', false);

	makeLuaSprite('bac', 'nightwatch/lightsoff', -1300, -1050);
	setScrollFactor('bac', 1, 1);
	scaleObject('bac', 4, 4);
      setProperty('bac.antialiasing', false);
      setProperty('bac.alpha', 0)

      makeLuaSprite('light1', 'nightwatch/michaellight', -1300, -1050);
	setScrollFactor('light1', 1, 1);
	scaleObject('light1', 4, 4);
      setProperty('light1.antialiasing', false);
      setProperty('light1.alpha', 0)
	setObjectOrder('light1', 8)

      makeLuaSprite('light2', 'nightwatch/bflight', -1300, -1050);
	setScrollFactor('light2', 1, 1);
	scaleObject('light2', 4, 4);
      setProperty('light2.antialiasing', false);
      setProperty('light2.alpha', 0)
	setObjectOrder('light2', 9)

	addLuaSprite('back', false);
	addLuaSprite('bac', false);
	addLuaSprite('light1', false);
	addLuaSprite('light2', false);
end

function onStepHit()
	if(curStep == 616 and songName == "nightwatch") then
		setProperty('light1.alpha', 0.9);
		setProperty('light2.alpha', 0.9);
            setProperty('bac.alpha', 1)
	end
	
      if(curStep == 1264 and songName == "nightwatch") then
		setProperty('light1.alpha', 0);
		setProperty('light2.alpha', 0);
            setProperty('bac.alpha', 0)
	end
end

function onCreatePost()
	setObjectOrder('gfGroup', 0)
end

function onUpdate(elapsed)
	if mustHitSection then
		setProperty('light1.visible', false)
		setProperty('light2.visible', true)
	else
		setProperty('light1.visible', true)
		setProperty('light2.visible', false)
	end
end