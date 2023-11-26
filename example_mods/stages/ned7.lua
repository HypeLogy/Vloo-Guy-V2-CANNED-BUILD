function onCreate()

	makeLuaSprite('ned7alt', 'ned7alt', -400, -100);
	setScrollFactor('ned7alt', 0.9, 0.9);
	setProperty('ned7alt.visible', false);

	makeLuaSprite('ned7', 'ned7', -600, -100);
	setScrollFactor('ned7', 0.9, 0.9);

	makeLuaSprite('jumpscare', 'nedjump', -475, 0);
	setScrollFactor('jumpscare', 0.9, 0.9);
      setProperty('jumpscare.visible', false);

	addLuaSprite('ned7', false);
	addLuaSprite('ned7alt', false);
	addLuaSprite('jumpscare', false);
end

function onStepHit()
	if(curStep == 1440 and songName == "d3ath") then
		setProperty('ned7.visible', false);
		setProperty('ned7alt.visible', true);
      end
	if(curStep == 1952 and songName == "d3ath") then
		setProperty('ned7alt.visible', false);
		setProperty('jumpscare.visible', true);
		setProperty('dadGroup.visible', false);
		setProperty('boyfriendGroup.visible', false);
    end
end