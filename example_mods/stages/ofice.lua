function onCreate()

	makeLuaSprite('obj1', 'bgStuff/combo', 711, 1078)
	setObjectOrder('obj1', 10)
	addLuaSprite('obj1', true)
	
	makeLuaSprite('obj2', 'bgStuff/theoffice', -324, -125)
	setObjectOrder('obj2', 0)
	scaleObject('obj2', 2.2, 2.2)
	addLuaSprite('obj2', true)
	
	makeLuaSprite('obj3', 'bgStuff/hall', -327, -125)
	setObjectOrder('obj3', 0)
	scaleObject('obj3', 2.2, 2.2)
	addLuaSprite('obj3', true)
	
	makeAnimatedLuaSprite('obj5', 'bgStuff/clown', -112, 184)
	setObjectOrder('obj5', 2)
	scaleObject('obj5', 1.1, 1.1)
	addAnimationByPrefix('obj5', 'anim', 'clown0', 24, true)
	playAnim('obj5', 'anim', true)
	addLuaSprite('obj5', true)
	
	makeAnimatedLuaSprite('obj6', 'bgStuff/red', 202, 292)
	setObjectOrder('obj6', 2)
	scaleObject('obj6', 0.7, 0.7)
	addAnimationByPrefix('obj6', 'anim', 'red guy0', 24, true)
	playAnim('obj6', 'anim', true)
	addLuaSprite('obj6', true)
	
	makeAnimatedLuaSprite('obj7', 'bgStuff/Eyesuar', 816, 355)
	setObjectOrder('obj7', 2)
	scaleObject('obj7', 1.3, 1.3)
	addAnimationByPrefix('obj7', 'anim', 'bgStuff/eyesuar bop0', 24, true)
	playAnim('obj7', 'anim', true)
	addLuaSprite('obj7', true)
	
	makeAnimatedLuaSprite('obj8', 'bgStuff/The_owl', 639, 315)
	setObjectOrder('obj8', 5)
	scaleObject('obj8', 1.3, 1.3)
	addAnimationByPrefix('obj8', 'anim', 'bgStuff/hoot bop0', 24, true)
	playAnim('obj8', 'anim', true)
	addLuaSprite('obj8', true)
end

function onEvent(n, v1, v2)
	if n == 'Freddy Intro' then
		doTweenX('freddyMove', 'dad', getProperty('dad.x') + 100, 4, 'cubeOut')
		doTweenAlpha('freddyFade', 'dad', 1, 4, 'cubeOut')
	end
	
	if n == 'Change Character' and v2 == 'freddy' then
		setProperty('dad.x', dadX)
		setProperty('dad.y', dadY)
	end
end