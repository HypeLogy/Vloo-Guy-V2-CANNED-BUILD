local iTime = 0
local glitchAmount = 0
local shake = false
local compaquelepareceesamorra = {x = 0, y = 0, width = 0, height = 0}

function onCreatePost()
    initLuaShader("dadglitch")

    makeLuaSprite("dadglitch")
    makeGraphic("dadglitch", screenWidth, screenHeight)

    setSpriteShader("dadglitch", "glitch")


    initLuaShader("cameraGlitch")

    makeLuaSprite("cameraGlitch")
    makeGraphic("cameraGlitch", screenWidth, screenHeight)

    setSpriteShader("cameraGlitch", "cameraGlitch")
    

    initLuaShader("dadiconglitch")

    makeLuaSprite("dadiconglitch")
    makeGraphic("dadiconglitch", screenWidth, screenHeight)

    setSpriteShader("dadiconglitch", "glitch")

    makeLuaSprite('windowPos', '', getPropertyFromClass('openfl.Lib','application.window.x'), getPropertyFromClass('openfl.Lib','application.window.y'))

    makeLuaSprite('windowScale', '', getPropertyFromClass('flixel.FlxG','width'), getPropertyFromClass('flixel.FlxG','height'))

    compaquelepareceesamorra.x = (getPropertyFromClass('openfl.Lib', 'application.window.stage.fullScreenWidth')/2 - 1280/2)
    compaquelepareceesamorra.y = (getPropertyFromClass('openfl.Lib', 'application.window.stage.fullScreenHeight')/2 - 720/2)

    compaquelepareceesamorra.width = 1280
    compaquelepareceesamorra.height = 720

    runHaxeCode([[
        var camGameShaders:Array<ShaderEffect> = [];

        camGameShaders.push(game.getLuaObject("cameraGlitch").shader);
        var newCamEffects:Array<BitmapFilter> = []; // IT SHUTS HAXE UP IDK WHY BUT WHATEVER IDK WHY I CANT JUST ARRAY<SHADERFILTER>
        for(i in camGameShaders){
            newCamEffects.push(new ShaderFilter(game.getLuaObject("cameraGlitch").shader));
        }

        setVar('newCamEffects', newCamEffects);
    ]])
end

function onUpdatePost(elapsed)
    iTime = iTime + 0.0001
    if glitchAmount > 0 then
        setShaderFloat('dadglitch', 'binaryIntensity', (10 - ((math.floor(glitchAmount / 20) * 20) * 9)) / 8)
        setShaderFloat('dadiconglitch', 'binaryIntensity', (10 - ((math.floor((glitchAmount) / 20) * 20) * 9)) / 8)

        setShaderFloat('cameraGlitch', 'time', iTime)

        runHaxeCode([[
            game.dadGroup.members[1].shader = game.getLuaObject("dadglitch").shader;

            game.iconP2.shader = game.getLuaObject("dadiconglitch").shader;

            //game.camGame.setFilters(getVar('newCamEffects'));
            game.camHUD.setFilters(getVar('newCamEffects'));
        ]])
    else
        runHaxeCode([[
            game.dadGroup.members[1].shader = null;

            game.iconP2.shader = null;

            //game.camGame.setFilters([]);
            game.camHUD.setFilters([]);
        ]])
    end

    if shake then
        --setProperty('windowPos.x', getProperty('windowPos.x')+getRandomInt(-5,5))
        --setProperty('windowPos.y', getProperty('windowPos.y')+getRandomInt(-5,5))

        --setProperty('windowScale.x', getProperty('windowScale.x')+getRandomInt(-10,10))
        --setProperty('windowScale.y', getProperty('windowScale.y')+getRandomInt(-10,10))

        setProperty('camHUD.x', getRandomFloat(-10, 10))
        setProperty('camHUD.y', getRandomFloat(-10, 10))
    end

    --setPropertyFromClass('openfl.Lib', 'application.window.x', getProperty('windowPos.x'))
    --setPropertyFromClass('openfl.Lib', 'application.window.y', getProperty('windowPos.y'))

    --setPropertyFromClass('openfl.Lib', 'application.window.width', getProperty('windowScale.x'))
    --setPropertyFromClass('openfl.Lib', 'application.window.height', getProperty('windowScale.y'))

    --setShaderFloat('shaderextrano', 'iTime', elpene)
end

function onEvent(n,v1,v2)
    if n == 'glitch' then
        glitchAmount = tonumber(v1)

        shake = true

        if v2 == 'false' then
            glitchAmount = 0

            --setProperty('windowPos.x', compaquelepareceesamorra.x)
            --setProperty('windowPos.y', compaquelepareceesamorra.y)

            --setProperty('windowScale.x', compaquelepareceesamorra.width)
            --setProperty('windowScale.y', compaquelepareceesamorra.height)

            shake = false
        end
    end 
end