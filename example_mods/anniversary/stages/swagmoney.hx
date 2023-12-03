



function onCreatePost()
{
    var bg = new FlxSprite().loadGraphic(Paths.image('bgs/bg'));
    bg.scale.set(0.25,0.25);
    bg.updateHitbox();
    addBehindDad(bg);
    // game.addBehindGF(bg)

    // // game.swapStrums();
    game.camOffset = 5;
    boyfriend.visible = false;

}