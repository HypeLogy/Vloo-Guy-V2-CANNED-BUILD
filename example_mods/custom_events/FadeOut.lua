function onEvent(name,value1,value2)	
    if name == 'FadeOut' then
        doTweenAlpha('fadeimg', 'fadeimg', '0', '1', 'linear')
    end
end