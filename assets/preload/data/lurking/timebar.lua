function onCreate() 
	setProperty('timeBar.visible', false)
	setProperty('timeBarBG.visible', false)
	setProperty('timeTxt.visible', true)
end
function onCreatePost() 
    setProperty('healthBar.alpha', tonumber(0))
    setProperty('iconP1.alpha', tonumber(0))
    setProperty('iconP2.alpha', tonumber(0))
end