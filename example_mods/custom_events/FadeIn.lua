function onCreate()
    makeLuaSprite('fadeimg', 'fadeimg')
    addLuaSprite('fadeimg', true);
    doTweenAlpha('fadeimg', 'fadeimg', '0', '0.0001', 'linear')
    setObjectCamera('fadeimg', 'hud')
end

function onEvent(name,value1,value2)	
    if name == 'FadeIn' then
        doTweenAlpha('fadeimg', 'fadeimg', '1', '1', 'linear')
    end
end

-- curBeat Support


-- function onBeatHit()
--      if curBeat == 5 then
--          doTweenAlpha('fadeimg', 'fadeimg', '1', '1', 'linear')
--      end

--      if curBeat == 10 then
--          doTweenAlpha('fadeimg', 'fadeimg', '0', '1', 'linear')
--     end
-- end 