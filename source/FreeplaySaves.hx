package;

#if desktop
import Discord.DiscordClient;
#end
import editors.ChartingState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import lime.utils.Assets;
import flixel.system.FlxSound;
import openfl.utils.Assets as OpenFlAssets;
import WeekData;
import flixel.addons.display.FlxTiledSprite;
import flixel.util.FlxSave;
import flixel.FlxCamera;
import flixel.system.FlxAssets;
#if MODS_ALLOWED
import sys.FileSystem;
#end

using StringTools;

class FreeplaySaves
{

    public static var emptyLock:String = 'locked';
    public static var preheatLock:String = 'locked';
    public static var italiandisputeLock:String = 'locked';
    public static var fazfailLock:String = 'locked';
    public static var decisionLock:String = 'locked';
    public static var terminatedLock:String = 'locked';
    public static var lurkingLock:String = 'locked';
    public static var chronologyLock:String = 'locked';
    public static var bufferLock:String = 'locked';
    public static var rottenLock:String = 'locked';
    public static var performanceLock:String = 'locked';
    public static var boiledLock:String = 'locked';
    public static var trappedLock:String = 'locked';
    public static var gofishLock:String = 'locked';
    public static var watchfulLock:String = 'locked';
    public static var restlessLock:String = 'locked';
    public static var goombeastLock:String = 'locked';
    public static var beastboxLock:String = 'locked';
    public static var showtimeLock:String = 'locked';
    public static var manLock:String = 'locked';
    public static var followedLock:String = 'locked';
    public static var fazfuckLock:String = 'locked';
    public static var criminalLock:String = 'locked';
    public static var millerLock:String = 'locked';
    public static var slooLock:String = 'locked';
    public static var d3athLock:String = 'locked';
    public static var bluntedLock:String = 'locked';
    public static var jedSweepLock:String = 'locked';
    public static var unlikelyrivalsLock:String = 'locked';
    public static var deathbattleLock:String = 'locked';
    public static var guyLock:String = 'locked';
    public static var midnightLock:String = 'locked';

    public static function fuckinSet() {
        if (FlxG.save.data.emptyLock == null) FlxG.save.data.emptyLock = 'locked';
        if (FlxG.save.data.italiandisputeLock == null) FlxG.save.data.italiandisputeLock = 'locked';
        if (FlxG.save.data.fazfailLock == null) FlxG.save.data.fazfailLock = 'locked';
        if (FlxG.save.data.decision == null) FlxG.save.data.decisionLock = 'locked';
        if (FlxG.save.data.preheatLock == null) FlxG.save.data.preheatLock = 'locked';
        if (FlxG.save.data.terminatedLock == null) FlxG.save.data.terminatedLock = 'locked';
        if (FlxG.save.data.lurkingLock == null) FlxG.save.data.lurkingLock = 'locked';
        if (FlxG.save.data.chronologyLock == null) FlxG.save.data.chronologyLock = 'locked';
        if (FlxG.save.data.bufferLock == null) FlxG.save.data.bufferLock = 'locked';
        if (FlxG.save.data.rottenLock == null) FlxG.save.data.rottenLock = 'locked';
        if (FlxG.save.data.performanceLock == null) FlxG.save.data.performanceLock = 'locked';
        if (FlxG.save.data.boiledLock == null) FlxG.save.data.boiledLock = 'locked';
        if (FlxG.save.data.deathbattleLock == null) FlxG.save.data.deathbattleLock = 'locked';
        if (FlxG.save.data.trappedLock == null) FlxG.save.data.trappedLock = 'locked';
        if (FlxG.save.data.gofishLock == null) FlxG.save.data.gofishLock = 'locked';
        if (FlxG.save.data.watchfulLock == null) FlxG.save.data.watchfulLock = 'locked';
        if (FlxG.save.data.restlessLock == null) FlxG.save.data.restlessLock = 'locked';
        if (FlxG.save.data.goombeastLock == null) FlxG.save.data.goombeastLock = 'locked';
        if (FlxG.save.data.beastboxLock == null) FlxG.save.data.beastboxLock = 'locked';
        if (FlxG.save.data.showtimeLock == null) FlxG.save.data.showtimeLock = 'locked';
        if (FlxG.save.data.manLock == null) FlxG.save.data.manLock = 'locked';
        if (FlxG.save.data.followedLock == null) FlxG.save.data.followedLock = 'locked';
        if (FlxG.save.data.fazfuckLock == null) FlxG.save.data.fazfuckLock = 'locked';
        if (FlxG.save.data.criminalLock == null) FlxG.save.data.criminalLock = 'locked';
        if (FlxG.save.data.millerLock == null) FlxG.save.data.millerLock = 'locked';
        if (FlxG.save.data.slooLock == null) FlxG.save.data.slooLock = 'locked';
        if (FlxG.save.data.d3athLock == null) FlxG.save.data.d3athLock = 'locked';
        if (FlxG.save.data.bluntedLock == null) FlxG.save.data.bluntedLock = 'locked';
        if (FlxG.save.data.jedSweepLock == null) FlxG.save.data.jedSweepLock = 'locked';
        if (FlxG.save.data.unlikelyrivalsLock == null) FlxG.save.data.unlikelyrivalsLock = 'locked';
        if (FlxG.save.data.guyLock == null) FlxG.save.data.guyLock = 'locked';
        if (FlxG.save.data.midnightLock == null) FlxG.save.data.midnightLock = 'locked';
        FlxG.save.flush();
    }

    public static function saveShit() {
        FlxG.save.data.fazfailLock = fazfailLock;
        FlxG.save.data.terminatedLock = terminatedLock;
        FlxG.save.data.decisionLock = decisionLock;
        FlxG.save.data.emptyLock = emptyLock;
        FlxG.save.data.preheatLock = preheatLock;
        FlxG.save.data.italiandisputeLock = italiandisputeLock;
        FlxG.save.data.lurkingLock = lurkingLock;
        FlxG.save.data.chronologyLock = chronologyLock;
        FlxG.save.data.bufferLock = bufferLock;
        FlxG.save.data.rottenLock = rottenLock;
        FlxG.save.data.performanceLock = performanceLock;
        FlxG.save.data.boiledLock = boiledLock;
        FlxG.save.data.deathbattleLock = deathbattleLock;
        FlxG.save.data.trappedLock = trappedLock;
        FlxG.save.data.gofishLock = gofishLock;
        FlxG.save.data.watchfulLock = watchfulLock;
        FlxG.save.data.restlessLock = restlessLock;
        FlxG.save.data.goombeastLock = goombeastLock;
        FlxG.save.data.beastboxLock = beastboxLock;
        FlxG.save.data.showtimeLock = showtimeLock;
        FlxG.save.data.manLock = manLock;
        FlxG.save.data.followedLock = followedLock;
        FlxG.save.data.fazfuckLock = fazfuckLock;
        FlxG.save.data.criminalLock = criminalLock;
        FlxG.save.data.millerLock = millerLock;
        FlxG.save.data.slooLock = slooLock;
        FlxG.save.data.d3athLock = d3athLock;
        FlxG.save.data.bluntedLock = bluntedLock;
        FlxG.save.data.jedSweepLock = jedSweepLock;
        FlxG.save.data.unlikelyrivalsLock = unlikelyrivalsLock;
        FlxG.save.data.guyLock = guyLock;
        FlxG.save.data.midnightLock = midnightLock;
        FlxG.save.flush();
    }

    public static function loadShit() { //golly gee willikers
        preheatLock = FlxG.save.data.preheatLock;
        fazfailLock = FlxG.save.data.fazfailLock;
        decisionLock = FlxG.save.data.decisionLock;
        emptyLock = FlxG.save.data.emptyLock;
        italiandisputeLock = FlxG.save.data.italiandisputeLock;
        terminatedLock = FlxG.save.data.terminatedLock;
        lurkingLock = FlxG.save.data.lurkingLock;
        chronologyLock = FlxG.save.data.chronologyLock;
        bufferLock = FlxG.save.data.bufferLock;
        rottenLock = FlxG.save.data.rottenLock;
        performanceLock = FlxG.save.data.performanceLock;
        boiledLock = FlxG.save.data.boiledLock;
        deathbattleLock = FlxG.save.data.deathbattleLock;
        trappedLock = FlxG.save.data.trappedLock;
        gofishLock = FlxG.save.data.gofishLock;
        watchfulLock = FlxG.save.data.watchfulLock;
        restlessLock = FlxG.save.data.restlessLock;
        goombeastLock = FlxG.save.data.goombeastLock;
        beastboxLock = FlxG.save.data.beastboxLock;
        showtimeLock = FlxG.save.data.showtimeLock;
        manLock = FlxG.save.data.manLock;
        followedLock = FlxG.save.data.followedLock;
        fazfuckLock = FlxG.save.data.fazfuckLock;
        criminalLock = FlxG.save.data.criminalLock;
        millerLock = FlxG.save.data.millerLock;
        slooLock = FlxG.save.data.slooLock;
        d3athLock = FlxG.save.data.d3athLock;
        bluntedLock = FlxG.save.data.bluntedLock;
        unlikelyrivalsLock = FlxG.save.data.unlikelyrivalsLock;
        guyLock = FlxG.save.data.guyLock;
        midnightLock = FlxG.save.data.midnightLock;
        FlxG.save.flush();
    }
}
