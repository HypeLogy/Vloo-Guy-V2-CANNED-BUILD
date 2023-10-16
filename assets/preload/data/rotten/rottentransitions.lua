function onStepHit()
	if(curStep == 888 and songName == "rotten") then
		setProperty('gfGroup.visible', false);
		setProperty('camGame.visible', false);
    end
	if(curStep == 896 and songName == "rotten") then
		setProperty('camGame.visible', true);
    end
	if(curStep == 1408 and songName == "rotten") then
		setProperty('gfGroup.visible', true);
    end
	if(curStep == 1464 and songName == "rotten") then
		setProperty('gfGroup.visible', false);
		setProperty('camGame.visible', false);
    end
	if(curStep == 1472 and songName == "rotten") then
		setProperty('camGame.visible', true);
    end
	if(curStep == 1980 and songName == "rotten") then
		setProperty('gfGroup.visible', true);
    end
	if(curStep == 2043 and songName == "rotten") then
		setProperty('gfGroup.visible', false);
		setProperty('camGame.visible', false);
    end
	if(curStep == 2048 and songName == "rotten") then
		setProperty('camGame.visible', true);
    end
end