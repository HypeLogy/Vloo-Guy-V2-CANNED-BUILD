function onEvent(n,v1,v2)
    if n == 'missingno type event' then
        if v1 == 'true' then
            for i = 0,getProperty('strumLineNotes.length') do
                setPropertyFromGroup('strumLineNotes', i, 'x', getRandomFloat(150, 1130))
                setPropertyFromGroup('strumLineNotes', i, 'y', getRandomFloat(150, 570))

                setPropertyFromGroup('strumLineNotes', i, 'direction', getRandomFloat(0, 360))
            end
        elseif v1 == 'false' then
            for i = 0,getProperty('strumLineNotes.length') do
                if i <= 3 then
                    setPropertyFromGroup('strumLineNotes', i, 'x', defaultOpponentStrumX0 + (112*i))
                    setPropertyFromGroup('strumLineNotes', i, 'y', defaultOpponentStrumY0)
                else
                    setPropertyFromGroup('strumLineNotes', i, 'x', defaultPlayerStrumX0 + (112*(i-4)))
                    setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0)
                end

                setPropertyFromGroup('strumLineNotes', i, 'direction', 90)
            end
        end
    end
end