package;

import flixel.graphics.FlxGraphic;
import sys.FileSystem;
#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
//import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import openfl.Assets;

#if VIDEOS_ALLOWED
#if (hxCodec >= "3.0.0")
import hxcodec.flixel.FlxVideo as MP4Handler;
#elseif (hxCodec == "2.6.1")
import hxcodec.VideoHandler as MP4Handler;
#elseif (hxCodec == "2.6.0")
import VideoHandler as MP4Handler;
#end
import vlc.MP4Handler;
#end

using StringTools;

class Intro extends MusicBeatState
{
    override public function create()
    {
      FlxG.sound.muteKeys = [];
      FlxG.sound.volumeDownKeys = [];
      FlxG.sound.volumeUpKeys = [];
      #if VIDEOS_ALLOWED
      var video = new VideoHandler();
      var video2 = new VideoHandler();
      video.canSkip = false;
      video2.canSkip = true;
      video.finishCallback = function()
      {
         video2.playVideo(Paths.video('sonicexe-intro'));
      }
      #end
      #if VIDEOS_ALLOWED
      video2.finishCallback = function()
      {
         FlxG.sound.muteKeys = TitleState.muteKeys;
         FlxG.sound.volumeDownKeys = TitleState.volumeDownKeys;
         FlxG.sound.volumeUpKeys = TitleState.volumeUpKeys;    
         MusicBeatState.switchState(new TitleState());
      }
      #else
      MusicBeatState.switchState(new TitleState());
      #end
      if (FlxG.save.data.storyProgress == 3) {
         #if VIDEOS_ALLOWED
	 video2.canSkip = false;
         video.finishCallback = function()
         {
            video2.playVideo(Paths.video('sonicexe-intro-fe'));
         }
         video2.finishCallback = function()
	 {
            PlayState.SONG = Song.loadFromJson('final-escape-hard', 'final-escape');
	    PlayState.isStoryMode = true;
	    PlayState.storyDifficulty = 2;
            PlayState.isFreeplay = false;
	    PlayState.storyWeek = 1;
	 }
         #else
	 PlayState.SONG = Song.loadFromJson('final-escape-hard', 'final-escape');
	 PlayState.isStoryMode = true;
	 PlayState.storyDifficulty = 2;
         PlayState.isFreeplay = false;
	 PlayState.storyWeek = 0;
	 #end
       }
       #if VIDEOS_ALLOWED
	    video.playVideo(Paths.video('HaxeFlixelIntro'));
       #end
    }
}
