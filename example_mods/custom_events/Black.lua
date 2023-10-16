function onEvent(name,value1)
if name == 'Black' then
	if value1 == '0' then
   makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'000000')
	      addLuaSprite('flash', true);
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
  end		
    if value1 == '1' then
    setProperty('flash.alpha',0)
end
   end 
end