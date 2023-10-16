function onCreate()
    setProperty('gf.visible', false)
end

function onUpdate(elapsed)
	if mustHitSection then
		setProperty('defaultCamZoom', 0.75)
	else
		setProperty('defaultCamZoom', 0.6)
	end
end