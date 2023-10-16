-- WARNING: When using this script, some of your saves might ovveride to keep the effect of the vanilla aesthetic go smooth.

-- PSYCH ENGINE: VANILLA RESKIN VIA. LUA --
-- CREDITS:
-- @cyn#5661 - Original Custom Healthbar Script (https://discord.com/channels/922849922175340586/922851578996744252/941509137601269800)
-- @Stilic#5989 - Combo popup on the counter (was too lazy to make one LMAOOO) (https://cdn.discordapp.com/attachments/922851578996744252/974003348158185523/noteComboPack.zip)
-- @BombasticTom#0084 - Scripting the script
-- ninja_muffin99 - Reference Code :nerd:

local preferences = { -- A guide for preferences.
	comboCamGame = false, -- if you want to see combo counter on camGame
	vanillaStrumPos = false, -- if you want the strums to position just like in vanilla (setting this to false also enables the strums to play animation on opponent strums)
	comboSprite = false, -- makes the combo text show
	prototypeText = false, -- if you want the prototype text to appear (set to true)
	vanillaCountFrom10 = true, -- if you want the combo number to show up after 10 combo (just like in vanilla) (set this to false in order to show numbers from start)
	vanillaHB = true, -- Want the vanilla healthbar colors?
	fpsVisible = false -- Wanna see your framerate?
}

local count = 0
local playerSettings = { -- DON'T MESS WITH THIS, YOU MIGHT BREAK SOMETHING :D
	['hideHud'] = {false, true},
	['ghostTapping'] = {true, true}
}

function string:startsWith(start)
    return self:sub(1, #start) == start
end

function math.lerp(a,b,c)
	return a + c * (b - a)
end

function math.remapToRange(value, start1, stop1, start2, stop2)
	return start2 + (value - start1) * ((stop2 - start2) / (stop1 - start1))
end

function math.boundTo(value, min, max)
	return math.max(min, math.min(max, value));
end

function configSettings()
	for setting, option in pairs(playerSettings) do
		playerSettings[setting][1] = getPropertyFromClass('ClientPrefs', setting);
		option[1] = playerSettings[setting][1];
		if option[1] ~= option[2] then
			setPropertyFromClass('ClientPrefs', setting, option[2]);
		end
	end
	if botPlay then setProperty('botplayTxt.visible', false) end
end

function popUpScore(note) -- just like the previous one lol
	local tag
	local myRating = getPropertyFromGroup('notes', note, 'rating')

	local pixel = getPropertyFromClass('PlayState', 'isPixelStage')
	local pixelShitPart1 = ''
	local pixelShitPart2 = ''
	local pixelMult = 1
	local antialiasing = getPropertyFromClass('ClientPrefs','globalAntialiasing')

	if pixel then
		pixelShitPart1 = 'pixelUI/'
		pixelShitPart2 = '-pixel'
		pixelMult = getPropertyFromClass('PlayState', 'daPixelZoom')
		antialiasing = false
	end

	count = count + 1
	tag = 'comboRating'..count

	makeLuaSprite(tag, pixelShitPart1 .. myRating .. pixelShitPart2, 0, 0)
	screenCenter(tag)
	setProperty(tag..'.x', screenWidth * 0.55 - 40)
	setProperty(tag..'.y', getProperty(tag..'.y') - 60)

	setGraphicSize(tag, getProperty(tag..'.width') * 0.7)
	setProperty(tag..'.antialiasing', antialiasing)
	if pixel then
		scaleObject(tag, 1, 1)
		setGraphicSize(tag, getProperty(tag..'.width') * pixelMult * 0.85)
	end

	updateHitbox(tag)
	
	addLuaSprite(tag, true)

	setProperty(tag..'.acceleration.y', 550)
	setProperty(tag..'.velocity.y', getProperty(tag..'.velocity.y') - math.random(140, 175))
	setProperty(tag..'.velocity.x', math.random(0, 10))
	runTimer(tag, crochet * 0.001)

	-- Modified combo text code made by Stilic

	if getProperty('combo') > 9 or not preferences.vanillaCountFrom10 then
		if preferences.comboSprite then
			-- lot of vars but shut up i know we need these
			count = count + 1
			tag = 'combo' .. count
			local offset = {0,0} --getPropertyFromClass('ClientPrefs', 'comboOffset')

			-- pixel style is great too
			makeLuaSprite(tag, pixelShitPart1 .. 'combo' .. pixelShitPart2, screenWidth * 0.55 + 45, 0)

			-- i wanted to put that after ratio var but psych don't let me do that
			screenCenter(tag, 'y')
			setProperty(tag .. '.y', getProperty(tag..'.y') + 35)

			setGraphicSize(tag, getProperty(tag..'.width') * 0.7)
			setProperty(tag..'.antialiasing', antialiasing)
			if pixel then
				scaleObject(tag, 1, 1)
				setGraphicSize(tag, getProperty(tag..'.width') * pixelMult * 0.85)
				setProperty(tag .. '.x', getProperty(tag..'.x') + 10)
				setProperty(tag .. '.y', getProperty(tag..'.y') + 25)
			end
			
			updateHitbox(tag)

			-- box2d based??? dik
			setProperty(tag .. '.acceleration.y', 600)
			setProperty(tag .. '.velocity.y', getProperty(tag .. '.velocity.y') - 150)
			setProperty(tag .. '.velocity.x', getProperty(tag .. '.velocity.x') - math.random(1,10))

			addLuaSprite(tag, true)

			-- fuck psych doesn't support startDelay so i use a timer instead
			runTimer(tag, crochet * 0.001)
		end

		-- k this part was made by me
	
		local combo = getProperty('combo')
		local seperatedScore = {}

		if combo >= 1000 then
			table.insert(seperatedScore, math.floor(combo / 1000) % 10)
		end
		table.insert(seperatedScore, math.floor(combo / 100) % 10)
		table.insert(seperatedScore, math.floor(combo / 10) % 10)
		table.insert(seperatedScore, combo % 10)

		for number,i in pairs(seperatedScore) do

			count = count + 1
			tag = 'comboNum'..count

			makeLuaSprite(tag,  pixelShitPart1 .. 'num'..i .. pixelShitPart2, 0, 0)
			screenCenter(tag)
			setProperty(tag..'.x', screenWidth * 0.55 + (43 * (number-1)) - 90)
			setProperty(tag..'.y', getProperty(tag..'.y') + 80)

			setGraphicSize(tag, getProperty(tag..'.width') * 0.5)
			setProperty(tag..'.antialiasing', antialiasing)
			if pixel then
				scaleObject(tag, 1, 1)
				setGraphicSize(tag, getProperty(tag..'.width') * pixelMult)
			end
			
			updateHitbox(tag)

			addLuaSprite(tag, true)

			setProperty(tag..'.acceleration.y', math.random(200, 300))
			setProperty(tag..'.velocity.y', getProperty(tag..'.velocity.y') - math.random(140, 160))
			setProperty(tag..'.velocity.x', math.random() + math.random(-5, 5))
			runTimer(tag, crochet * 0.002)
		end
	end
end

function fixStrumPosition()
	if not preferences.vanillaStrumPos then return end

	for i=0, getProperty('strumLineNotes.length')-1 do
		setPropertyFromGroup('strumLineNotes', i, 'x', (screenWidth / 2 * getPropertyFromGroup('strumLineNotes', i, 'player')) + 50 + getPropertyFromClass('Note', 'swagWidth') * (i%4))
	end
end

function onTimerCompleted(tag)
	if tag:startsWith('combo') then
		doTweenAlpha(tag, tag, 0, 0.2, 'linear')
	end
end

function onTweenCompleted(tag)
	if tag:startsWith('combo') then
		removeLuaSprite(tag, true)
	end
end

function onCreatePost()
	luaDebugMode = true
	configSettings();
	if not preferences.comboCamGame then setPropertyFromClass('ClientPrefs', 'hideHud', false) end
	setPropertyFromClass('lime.app.Application', 'current.window.title', "Friday Night Funkin'")
	setPropertyFromClass('Main', 'fpsVar.visible', preferences.fpsVisible)

	if preferences.vanillaHB then setHealthBarColors('FF0000', '66FF33') end
	setProperty('iconP1.visible', false);
	setProperty('iconP2.visible', false);
	setProperty('healthBar.visible', true);
	setProperty('healthBarBG.visible', true);
	setProperty('scoreTxt.visible', false);

	makeLuaText('luaScoreTxt', 'Score:0', 0, getProperty('healthBarBG.x') + getProperty('healthBarBG.width') - 190, getProperty('healthBarBG.y') + 30);
	setTextSize('luaScoreTxt', 16);
	setTextBorder('luaScoreTxt', 1, '000000');
	addLuaText('luaScoreTxt');

	local p1 = getProperty('boyfriend.healthIcon')

	makeAnimatedLuaSprite('luaIconP1', nil, 0, 0);
	loadGraphic('luaIconP1', 'icons/icon-'..p1, 150);
	addAnimation('luaIconP1', p1, {0,1}, 0, true)
	playAnim('luaIconP1', p1, true);
	
	local p2 = getProperty('dad.healthIcon')

	makeAnimatedLuaSprite('luaIconP2', nil, 0, 0);
	loadGraphic('luaIconP2', 'icons/icon-'..p2, 150);
	addAnimation('luaIconP2', p2, {0,1}, 0, true)
	playAnim('luaIconP2', p2, true);

	setProperty('luaIconP1.y', getProperty('healthBar.y') - (getProperty('luaIconP1.height')/2))
	setProperty('luaIconP1.flipX', true)
	setObjectCamera('luaIconP1', 'camHUD');
	addLuaSprite('luaIconP1', true);

	setProperty('luaIconP2.y', getProperty('healthBar.y') - (getProperty('luaIconP2.height')/2))
	setObjectCamera('luaIconP2', 'camHUD');
	addLuaSprite('luaIconP2', true);

	fixStrumPosition();

	if preferences.prototypeText then
		makeLuaText('proto', 'v0.3.0 (163ea06) PROTOTYPE', 300, 0, 0)
		setProperty('proto.x', screenWidth - getProperty('proto.width'))
		setProperty('proto.y', screenHeight - getProperty('proto.height'))
		setTextSize('proto', 16)
		setTextAlignment('proto', 'right')
		addLuaText('proto')
		setObjectOrder('proto', getObjectOrder('luaScoreTxt'))
		setTextBorder('proto', 1.75, '000000')
	end
end

function onEvent(n, v1, v2)
	if n == 'Change Character' then
		if preferences.vanillaHB then setHealthBarColors('FF0000', '66FF33') end
		setProperty('iconP1.visible', false);
		setProperty('iconP2.visible', false);
	end
end

function onDestroy()
	for setting, option in pairs(playerSettings) do
		setPropertyFromClass('ClientPrefs', setting, option[1]);
	end
end

function onCountdownTick(count)
	if count == 0 then
		fixStrumPosition();
	end
end

function onUpdatePost(elapsed)
	
	local playbackRate = getProperty('playbackRate')
	if playbackRate == 'playbackRate' then
		playbackRate = 1 -- MAN WHAT ARE YOU DOING? UPDATE TO 0.6.3 ALREADY BRUH
	end
 
	for i=0, getProperty('grpNoteSplashes.length')-1 do
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -28);
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', -18);
	end

	setGraphicSize('luaIconP1', math.floor(math.lerp(150, getProperty('luaIconP1.width'), math.boundTo(1 - (elapsed * 9 * playbackRate), 0, 1))))
	setGraphicSize('luaIconP2', math.floor(math.lerp(150, getProperty('luaIconP2.width'), math.boundTo(1 - (elapsed * 9 * playbackRate), 0, 1))))

	updateHitbox('luaIconP1')
	updateHitbox('luaIconP2')

	setProperty('luaIconP1.x', getProperty('healthBar.x') + (getProperty('healthBar.width') * (math.remapToRange(getProperty('healthBar.percent'), 0, 100, 100, 0) * 0.01) - 26))
	setProperty('luaIconP2.x', getProperty('healthBar.x') + (getProperty('healthBar.width') * (math.remapToRange(getProperty('healthBar.percent'), 0, 100, 100, 0) * 0.01)) - (getProperty('luaIconP2.width') - 26))

	if getProperty('healthBar.percent') < 20 then
		setProperty('luaIconP1.animation.curAnim.curFrame', 1)
	else
		setProperty('luaIconP1.animation.curAnim.curFrame', 0)
	end

	if getProperty('healthBar.percent') > 80 then
		setProperty('luaIconP2.animation.curAnim.curFrame', 1)
	else
		setProperty('luaIconP2.animation.curAnim.curFrame', 0)
	end
end

function onBeatHit()
	setGraphicSize('luaIconP1', math.floor(getProperty('luaIconP1.width') + 30))
	setGraphicSize('luaIconP2', math.floor(getProperty('luaIconP2.width') + 30))

	updateHitbox('luaIconP1')
	updateHitbox('luaIconP2')
end

function onUpdateScore()
	setTextString('luaScoreTxt', 'Score:'..score);
end

function opponentNoteHit(id, noteData)
	runHaxeCode([[game.opponentStrums.members[]]..noteData..[[].playAnim('static', true)]]);
end

function goodNoteHit(id, noteData, noteType, isSustainNote)

	if not isSustainNote then
		if getProperty('cpuControlled') then
			addScore(350)
		end
		if preferences.comboCamGame then
			popUpScore(id)
		end
	end
end