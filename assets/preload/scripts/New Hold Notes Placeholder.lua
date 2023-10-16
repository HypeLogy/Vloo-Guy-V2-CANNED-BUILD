function onCreatePost()
  for i=0,getProperty 'unspawnNotes.length'-1 do
    if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
      setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
    end
  end
end
--remove below if you dont want the animation length to be extended by sustains
function goodNoteHit(id, data, type, sus)
  if sus then
    setProperty('boyfriend.holdTimer', 0)
  end
end
function opponentNoteHit(id, data, type, sus)
  if sus then
    setProperty('dad.holdTimer', 0)
  end
end