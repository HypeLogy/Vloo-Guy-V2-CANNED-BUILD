function onCreate()
    time = 0
    originY = getCharacterY('dad')
    runTimer('time', 0.01, 0)
end
function onTimerCompleted(tags, loops, loopsLeft)
    time = time + 1
    setCharacterY('dad', originY + math.sin(time / 50) * 50)
    --debugPrint(time)
    runTimer('time', 0.01, 0)
    if focusOnBunny == 1 then
        cameraSetTarget('dad')
    end
end
function onMoveCamera(focus)
    if focus == 'dad' then
        focusOnBunny = 1
    else
        focusOnBunny = 0
    end
end