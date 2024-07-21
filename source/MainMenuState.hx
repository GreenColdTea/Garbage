package;

import flixel.input.keyboard.FlxKey;
import flixel.input.gamepad.FlxGamepad;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import editors.MasterEditorMenu;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import options.OptionsState;

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.6.3'; //This is also used for Discord RPC
	var curSelected:Int = 0;

	var xval:Int = 585;

	var menuItems:FlxTypedGroup<FlxSprite>;

	var soundCooldown:Bool = true;

	var optionShit:Array<String> = [
		'story_mode',
		'encore',
		'freeplay',
                'credits',
		'sound_test',
		'options',
		'extras'
	];

	var newGaming:FlxText;
	var newGaming2:FlxText;
	public static var firstStart:Bool = true;

        public var selectedSomethin:Bool = false;

	public static var nightly:String = "";

	public static var kadeEngineVer:String = "1.5.4" + nightly;
	public static var gameVer:String = "0.2.8";

        var buttonsBG:FlxSprite;
        var bgUP:FlxSprite;
        var bgDOWN:FlxSprite;
	var camFollow:FlxObject;
	public static var finishedFunnyMove:Bool = false;
	var debugKeys:Array<FlxKey>;

	override function create()
	{
		/*#if debug
		optionShit.push('sound test');
		#else
		optionShit.push('sound test locked');
		#end
		if(!ClientPrefs.beatweek){
			optionShit.push('sound_test locked');
			optionShit.push('encore locked');
		}
		else{
			optionShit.push('sound_test');
			optionShit.push('encore');
		}*/
		
		Paths.clearStoredMemory();
		Paths.clearUnusedMemory();


		#if windows
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		FlxG.sound.playMusic(Paths.music('freakyMusic'));
		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 6)), 0.1);
		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite();
		bg.frames = Paths.getSparrowAtlas('mainmenu/bg-new');
		bg.animation.addByPrefix('a', 'bg');
		bg.animation.play('a', true);
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0;
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);

      buttonsBG = new FlxSprite(100, 0).loadGraphic(Paths.image('mainmenu/buttons-bg'));
		buttonsBG.scrollFactor.x = 0;
		buttonsBG.scrollFactor.y = 0;
		buttonsBG.updateHitbox();
		buttonsBG.antialiasing = true;
		add(buttonsBG);

      bgUP = new FlxSprite(0, 0).loadGraphic(Paths.image('mainmenu/fg-up'));
		bgUP.scrollFactor.x = 0;
		bgUP.scrollFactor.y = 0;
		bgUP.updateHitbox();
		bgUP.antialiasing = true;
		add(bgUP);

      bgDOWN = new FlxSprite(0, 0).loadGraphic(Paths.image('mainmenu/fg-up'));
		bgDOWN.scrollFactor.x = 0;
		bgDOWN.scrollFactor.y = 0;
		bgDOWN.updateHitbox();
		bgDOWN.antialiasing = true;
		add(bgDOWN);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		for (i in 0...optionShit.length)
		{
			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(-500, (i * 100)  + offset);
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/buttons/' + optionShit[i]);
			menuItem.animation.addByPrefix('selected', optionShit[i] + "0001", 24);
			menuItem.animation.addByPrefix('lock', optionShit[i] + "0002", 24);
         menuItem.animation.addByPrefix('lockSelected', optionShit + "0003", 24);
		if (!ClientPrefs.beatweek && optionShit[i] == 'sound_test') {
				menuItem.animation.play('lock');
				menuItem.animation.addByPrefix('idle', optionShit[i] + "0003", 24);
			}
			else
			{
				menuItem.animation.addByPrefix('idle', optionShit[i] + "0002", 24);
				menuItem.animation.play('idle');
			}
			
			menuItem.ID = i;
			menuItem.screenCenter(X);
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if(optionShit.length < 4) scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			menuItem.updateHitbox();

         switch (i)
			{
			    case 0:
					//menuItem.x = -500;
					menuItem.y = 0;
					menuItem.scrollFactor.set(1, 1);
				case 1:
					//menuItem.x = -200;
					menuItem.y = 0;
					menuItem.scrollFactor.set(1, 1);
				case 2:
					//menuItem.x = 100;
					menuItem.y = 0;
					menuItem.scrollFactor.set(1, 1);
				case 3:
					menuItem.y = 0;
					menuItem.scrollFactor.set(1, 1);
				case 4:
					menuItem.y = 0;
					menuItem.scrollFactor.set(1, 1);
			}
				menuItem.y = 300 + (i * 350);


		FlxG.camera.follow(camFollow, null, 0.60 * (60 / FlxG.save.data.fpsCap));

		var credits:FlxText = new FlxText(FlxG.width - 300, FlxG.height - 18 * 2, 300, "Android Port By JustWeNice/nPress C to delete the progress", 3);
		credits.scrollFactor.set();
		credits.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(credits); //If you reading this, I'm putting random comments on my code cuz i feel lonely.

		changeItem();

		#if android
			addVirtualPad(UP_DOWN, A_B_X_Y);
		#end

		super.create();
	}
	}

	override function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.DELETE #if android || _virtualpad.buttonX.justPressed #end)
		{
			var urmom = 0;
			new FlxTimer().start(0.1, function(hello:FlxTimer)
			{
				urmom += 1;
				if (urmom == 30)
				{
					FlxG.save.data.storyProgress = 0;
					FlxG.save.data.soundTestUnlocked = false;
					FlxG.save.data.songArray = [];
					FlxG.switchState(new Intro());
				}
				if (FlxG.keys.pressed.DELETE)
				{
					hello.reset();
				}
			});
		}

		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}
		if (!selectedSomethin)
		{
				if (FlxG.keys.justPressed.UP || controls.UI_UP_P)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'));
					changeItem(-1);
				}

				if (FlxG.keys.justPressed.DOWN || controls.UI_DOWN_P)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'));
					changeItem(1);
				}

				if (FlxG.keys.justPressed.BACKSPACE || controls.BACK)
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('cancelMenu'));
					MusicBeatState.switchState(new TitleState());
				}

		if (FlxG.keys.justPressed.ENTER || controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else if (!ClientPrefs.beatweek && optionShit[curSelected] == 'sound_test')
				{
					soundCooldown = false;
					FlxG.sound.play(Paths.sound('deniedMOMENT'));
					camera.shake(0.03,0.03);
					new FlxTimer().start(0.8, function(tmr:FlxTimer)
					{
						soundCooldown = true;
					});
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'story_mode':
										MusicBeatState.switchState(new StoryMenuState());
									case 'freeplay':
										MusicBeatState.switchState(new FreeplayState());
									case 'encore':
										MusicBeatState.switchState(new EncoreState());
									case 'credits':
										MusicBeatState.switchState(new CreditsState());
									case 'sound_test':										
										MusicBeatState.switchState(new SoundTestMenu());									
									case 'options':
										MusicBeatState.switchState(new OptionsState());
                                                                        case 'extras':
										MusicBeatState.switchState(new ExtraState());
								}
							});
						}
					});
				}
			}
			if (FlxG.keys.justPressed.SIX)
			{
				MusicBeatState.switchState(new EncoreState());
			}
			if (FlxG.keys.justPressed.SEVEN #if android || _virtualpad.buttonY.justPressed #end)
			{
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			if (FlxG.keys.justPressed.EIGHT)
			{
				MusicBeatState.switchState(new FreeplayState());
			}
		}

		super.update(elapsed);
	}

	function changeItem(huh:Int = 0)
	{
		if (finishedFunnyMove)
		{
			curSelected += huh;
			
			if (curSelected >= menuItems.length)
				curSelected = 0;
			if (curSelected < 0)
				curSelected = menuItems.length - 1;
			
			
		}
		menuItems.forEach(function(spr:FlxSprite)
		{
			var daChoice:String = optionShit[curSelected];
			if(!ClientPrefs.beatweek && daChoice == 'sound_test'){
					spr.animation.play('lock');
				}
			spr.animation.play('idle');
			
			/*
			if (huh != 0)
			{
				FlxTween.cancelTweensOf(spr);
			}
			FlxTween.tween(spr, {x: 100 + ((curSelected * -1 + spr.ID + 1) * 220) , y: 40 + ((curSelected * -1 + spr.ID + 1) * 140)}, 0.2);
			*/

			
			
			if (spr.ID == curSelected && finishedFunnyMove)
			{
				if(!ClientPrefs.beatweek && daChoice == 'sound_test'){
					spr.animation.play('lock');
				}
				else
				spr.animation.play('lockSelected');
				camFollow.setPosition(spr.getGraphicMidpoint().x + 150, spr.getGraphicMidpoint().y +70);
			}

			spr.updateHitbox();
		});
	}
}
