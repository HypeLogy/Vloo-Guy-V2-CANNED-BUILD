local xx = 1000;
local yy = 550;
local ofs = 18;
local followchars = true;

function onUpdate()
	if followchars == true then
		if gfSection == true then
			local gfAnim = getProperty('gf.animation.curAnim.name')

			if gfAnim == 'singLEFT' then
				triggerEvent('Camera Follow Pos',xx-ofs,yy)
			elseif gfAnim == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',xx+ofs,yy)
			elseif gfAnim == 'singUP' then
				triggerEvent('Camera Follow Pos',xx,yy-ofs)
			elseif gfAnim == 'singDOWN' then
				triggerEvent('Camera Follow Pos',xx,yy+ofs)
			elseif gfAnim == 'idle' then
				triggerEvent('Camera Follow Pos',xx,yy)
			end
		else
			triggerEvent('Camera Follow Pos','','')
		end
	end
end