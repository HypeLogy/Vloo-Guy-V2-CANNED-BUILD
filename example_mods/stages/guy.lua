function onCreate()
	makeLuaSprite('a','stages/guy/guyback', 0, 0);
	scaleObject('a', 1, 1);
	updateHitbox('a');
	setProperty('a.antialiasing', false);
    setObjectOrder('a', 0)
	addLuaSprite('a',false);

	makeLuaSprite('b','stages/guy/guyfront', 0, 0);
	scaleObject('b', 1, 1);
	updateHitbox('b');
	setProperty('b.antialiasing', false);
    setObjectOrder('b', 1)
	addLuaSprite('b',false);

	makeLuaSprite('c','stages/guy/kosejumpscare', 0, 0);
	scaleObject('c', 1, 1);
	updateHitbox('c');
	setProperty('c.antialiasing', false);
    setProperty('c.alpha', 0)
    setObjectOrder('c', 2)
	addLuaSprite('c',false);


	makeAnimatedLuaSprite("vloo", 'stages/guy/Vloofriend',-9,-66)
	addAnimationByPrefix("vloo", "i", "Vloo guy", 12, false)
	setProperty('vloo.antialiasing', false)
	--playAnim("vloo", "i")
	addLuaSprite('vloo',true)
	scaleObject('vloo',0.8,0.8,true)
	setProperty('vloo.alpha', 0)
end

checkforanim = false

function onEvent(r, r1, r2)
	if r == '' and r1 == 'fixvloo' then
		checkforanim = true
		setProperty('vloo.alpha', 1)
		setProperty('dad.alpha', 0)
		playAnim("vloo", "i")

		
	end
	
end

function onUpdatePost(elapsed)
	if checkforanim then
		if getProperty('vloo.animation.curAnim.finished') then
			setProperty('vloo.alpha', 0)
			setProperty('dad.alpha', 1)
			checkforanim = false
		end
	end
end