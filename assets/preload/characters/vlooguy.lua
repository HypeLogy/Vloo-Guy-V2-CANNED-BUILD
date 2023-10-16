flippedIdle = false
flipped = true
duration = 0
function onCreatePost()
	duration = getPropertyFromClass('Conductor', 'stepCrochet') * 2 / 1100
end

function onBeatHit()
	if getProperty('healthBar.percent') < 80 then
		flipped = not flipped
		setProperty('iconP2.flipX', flipped)
		doTweenY('jumpUp', 'iconP2', getProperty('iconP2.y') - 10, duration, 'cubeOut')
	end

	if curBeat % 1 == 0 and getProperty('dad.animation.curAnim.name') == 'idle' then
		flippedIdle = not flippedIdle
		setProperty('dad.flipX', flippedIdle)
	end
end

function onTweenCompleted(tag)
	if tag == 'jumpUp' then
		doTweenY('fallDown', 'iconP2', getProperty('iconP2.y') + 10, duration, 'cubeIn')
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if not getPropertyFromGroup('notes', id, 'gfNote') then
	end
end

function onUpdate(e)
	local angleOfs = math.random(-5, 5)
	if getProperty('healthBar.percent') > 80 then
		setProperty('iconP2.angle', angleOfs)
	else
		setProperty('iconP2.angle', 0)
	end
end