


function onCreatePost(){
    var bg = new FlxSprite().loadGraphic(Paths.image('bgs/b'));
    game.addBehindGF(bg);

    var curtains = new FlxSprite().loadGraphic(Paths.image('bgs/b1'));
    game.add(curtains);

    game.swapStrums();
}