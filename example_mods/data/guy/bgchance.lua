local counter = 0
function onPause()
    if getRandomBool(1) then
       setProperty('c.alpha', 1)
       setProperty('b.alpha', 0)
        counter = counter + 1
    end

end
