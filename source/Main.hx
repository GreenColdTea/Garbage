package;

import flixel.graphics.FlxGraphic;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import sys.FileSystem;
import openfl.Assets;
import openfl.Lib;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.StageScaleMode;
import lime.system.System;
import lime.app.Application;

#if desktop
import Discord.DiscordClient;
#end

#if CRASH_HANDLER
import openfl.events.UncaughtErrorEvent;
import haxe.CallStack;
import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;
import sys.io.Process;
#end

using StringTools;

class Main extends Sprite
{
	var gameWidth:Int = 1280; // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var gameHeight:Int = 720; // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
	public static var initialState:Class<FlxState> = TitleState; // The FlxState the game starts with.
	var zoom:Float = -1; // If -1, zoom is automatically calculated to fit the window dimensions.
	var framerate:Int = 60; // How many frames per second the game should run at.
	var skipSplash:Bool = true; // Whether to skip the flixel splash screen that appears in release mode.
	var startFullscreen:Bool = false; // Whether to start the game in fullscreen on desktop targets
	public static var fpsVar:FPS;

	// You can pretty much ignore everything from here on - your code should go in your states.
 	public static var path:String = System.applicationStorageDirectory;
	
	static final losvideos:Array<String> = [
		"bothCreditsAndIntro",
		"explosion",
		"glasses",
		"guns",
		"HaxeFlixelIntro",
                "sonicexe-intro",
		"hitmarkers",
		"illuminati",
		"IlluminatiConfirmed",
		"introCREDITS",
		"mlg",
		"noscope",
		"sonic1",
		"sound-test-codes",
                "the-gaze-of-a-god_NoAudio",
                "soulless-intro",
		"tooslowcutscene1",
		"tooslowcutscene2",
		"weed",
		"youcantruncutscene2",
                "ycr-encore-intro",
                "ugly-intro",
                "tt-final",
                "sonic-exe-intro-fe",
                "i-am-god-NoAudio",
                "fof-intro",
                "critical-error-intro"
	]; //better way to do this?
	
	static final videosdead:Array<String> = [
		"Atomic",
		"BfFuckingDies",
		"Car",
		"FastBear",
		"g00seb4rn6",
		"JoeManReference",
		"Kys"
	]; //someone kill me

        static final seriousdead:Array<String> = [
                 "1",
                 "2",
                 "3",
                 "4",
                 "Secret"
        ]; //serious death OuOuouououoo

	public static function main():Void {
		Lib.current.addChild(new Main());
	}

	public function new()
	{
           FlxG.save.bind("MyGameSave");
           if (FlxG.save.data.exeInfoShown == null) {
               FlxG.save.data.exeInfoShown = false;
               FlxG.save.flush();
	   } 
		
		super();

                SUtil.gameCrashCheck();

		if (stage != null)
		{
			init();
		}
		else
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}

	private function init(?E:Event):Void
	{
		if (hasEventListener(Event.ADDED_TO_STAGE))
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}

		setupGame();
	}

	private function setupGame():Void
	{
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;

		if (zoom == -1)
		{
			var ratioX:Float = stageWidth / gameWidth;
			var ratioY:Float = stageHeight / gameHeight;
			zoom = Math.min(ratioX, ratioY);
			gameWidth = Math.ceil(stageWidth / zoom);
			gameHeight = Math.ceil(stageHeight / zoom);
		}
		
		SUtil.doTheCheck();
	
		addChild(new FlxGame(gameWidth, gameHeight, initialState, zoom, framerate, framerate, skipSplash, startFullscreen));

		Lib.current.stage.align = "tl";
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;

	        #if CRASH_HANDLER
		Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, onCrash);
		#end
		
		#if !debug
		initialState = Intro;
		#end

		ClientPrefs.loadDefaultKeys();
		// FlxGraphic.defaultPersist = true;
		
		fpsVar = new FPS(10, 3, 0xFFFFFF);
		addChild(fpsVar);
		if(fpsVar != null) {
			fpsVar.visible = ClientPrefs.showFPS;
		}

		#if html5
		FlxG.autoPause = false;
		FlxG.mouse.visible = false;
		#end
	}

	#if CRASH_HANDLER
	function onCrash(e:UncaughtErrorEvent):Void
	{
		var errMsg:String = "";
		var path:String;
		var callStack:Array<StackItem> = CallStack.exceptionStack(true);
		var dateNow:String = Date.now().toString();

		dateNow = dateNow.replace(" ", "_");
		dateNow = dateNow.replace(":", "'");

		path = "./crash/" + "RoSE_" + dateNow + ".txt";

		for (stackItem in callStack)
		{
			switch (stackItem)
			{
				case FilePos(s, file, line, column):
					errMsg += file + " (line " + line + ")\n";
				default:
					Sys.println(stackItem);
			}
		}

		errMsg += "\nUncaught Error: " + e.error + "\nPlease report this error to the GitHub page: https://github.com/ShadowMario/FNF-PsychEngine\n\n> Crash Handler written by: sqirra-rng";

		if (!FileSystem.exists("./crash/"))
			FileSystem.createDirectory("./crash/");

		File.saveContent(path, errMsg + "\n");

		Sys.println(errMsg);
		Sys.println("Crash dump saved in " + Path.normalize(path));

		Application.current.window.alert(errMsg, "Error!");
         #if desktop
		DiscordClient.shutdown();
	 #end
		Sys.exit(1);
	}
	#end

	public function getFPS():Float{
		return fpsVar.currentFPS;	
	}
}
