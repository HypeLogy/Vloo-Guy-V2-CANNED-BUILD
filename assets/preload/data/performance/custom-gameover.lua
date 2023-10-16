--data/'song'/

function onCreate()
    --Sprites mods/characters
    setPropertyFromClass('GameOverSubstate', 'characterName', 'MIMIC')
    --Death sound mods/sounds
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx')
    --Dead music mods/music
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver')
    --Retry sound mods/music
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd')
end