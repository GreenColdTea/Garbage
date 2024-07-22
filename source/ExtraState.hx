package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.system.FlxSound;
import WeekData;

using StringTools;

class ExtraState extends MusicBeatState {
  //Complete the story mode bitch!!
  var goufuckoffbitch:FlxSprite;
  public var getout:Bool = true;

  //background color
  var Black:FlxSprite;
  
  //Extra menu screen
  var extraMenu:FlxSprite;
  var DebugChoice:FlxSprite;
  var SkinsChoice:FlxSprite;
  var songsChoice:FlxSprite;
  
  //Extra menu selected
  var DebugChoiceSelec:FlxSprite;
  var SkinsChoiceSelec:FlxSprite;
  var songsChoiceSelec:FlxSprite;
  
  //debug menu
  var debugMenu:FlxSprite;
  
  //debug choices
  var botplayOFF:FlxSprite;
  var botplayON:FlxSprite;
  var practiceOFF:FlxSprite;
  var practiceON:FlxSprite;
  
  //debug select arrows
  var debugArrow1:FlxSprite;
  var debugArrow4:FlxSprite;
  
  //songs menu
  var songsMenu:FlxSprite;
  
  //songs menu page buttons
  var nextPage:FlxSprite;
  var previousPage:FlxSprite;
  
  //song select arrows
  var songArrow1:FlxSprite;
  var songArrow2:FlxSprite;
  var songArrow3:FlxSprite;
  var songArrow4:FlxSprite;
  var songArrow5:FlxSprite;
  var songArrow6:FlxSprite;
  var songArrow7:FlxSprite;
  var songArrow8:FlxSprite;
  var songArrow9:FlxSprite;
  var songArrow10:FlxSprite;
  var songArrow11:FlxSprite;
  var songArrow12:FlxSprite;
 
  //songs name prev page 1-12
  var hotv:FlxSprite;
  var iceCap:FlxSprite;
  var EndeavOG:FlxSprite;
  var execInski:FlxSprite;
  var redglove:FlxSprite;
  var coolparty:FlxSprite;
  var meltingOld:FlxSprite;
  var drippyShine:FlxSprite;
  var terror:FlxSprite;
  var toofestOld:FlxSprite;
  var nostalgicDuo:FlxSprite;
  var unresponsive:FlxSprite;
  //next page 13-24
  var preyV1:FlxSprite;
  var Lukas:FlxSprite;
  var hazeOG:FlxSprite;
  var hollowOld:FlxSprite;
  var longSky:FlxSprite;
  var perdition:FlxSprite;
  var Wechidna:FlxSprite;
  var playful:FlxSprite;
  var tetrabrachial:FlxSprite;
  var ColorBlindOld:FlxSprite;
  var batmanOld:FlxSprite;
  var sonichu:FlxSprite;

  //songs name selected prev page 1-12
  var hotvSel:FlxSprite;
  var iceCapSel:FlxSprite;
  var EndeavOGSel:FlxSprite;
  var execInskiSel:FlxSprite;
  var redgloveSel:FlxSprite;
  var coolpartySel:FlxSprite;
  var meltingOldSel:FlxSprite;
  var drippyShineSel:FlxSprite;
  var terrorSel:FlxSprite;
  var toofestOldSel:FlxSprite;
  var nostalgicDuoSel:FlxSprite;
  var unresponsiveSel:FlxSprite;
  //next page selected 13-24
  var preyV1Sel:FlxSprite;
  var LukasSel:FlxSprite;
  var hazeOGSel:FlxSprite;
  var hollowOldSel:FlxSprite;
  var longSkySel:FlxSprite;
  var perditionSel:FlxSprite;
  var WechidnaSel:FlxSprite;
  var playfulSel:FlxSprite;
  var tetrabrachialSel:FlxSprite;
  var ColorBlindOldSel:FlxSprite;
  var batmanOldSel:FlxSprite;
  var sonichuSel:FlxSprite;
  
  public var inExtraScreen:Bool = true;
  
  override public function create()
  {
    Paths.clearStoredMemory();
    Paths.clearUnusedMemory();
		
    getout = false;
		
    FlxG.sound.playMusic(Paths.music('extras'));

    Conductor.changeBPM(104);

    if (getout) {
      #if android
        addVirtualPad(NONE, B);
      #end
      goufuckoffbitch = new FlxSprite(0, 0);
      goufuckoffbitch.loadGraphic(Paths.image('extra/code/Story'));
      goufuckoffbitch.antialiasing = true;
      goufuckoffbitch.screenCenter();
      goufuckoffbitch.updateHitbox();
      add(goufuckoffbitch);
    }
    
    if (!getout) {
      #if android
      addVirtualPad(LEFT_FULL, A_B);
      #end
      extraMenu = new FlxSprite(0, 0);
      extraMenu.loadGraphic(Paths.image('extra/extras/ExtrasWG'));
      extraMenu.antialiasing = true;
      extraMenu.screenCenter();
      extraMenu.updateHitbox();
      extraMenu.scale.x = 1.5;
      extraMenu.scale.y = 1.5;
      add(extraMenu);
    }
  }
  override public function destroy() {
      FlxG.sound.music.stop();
      super.destroy();
   }
   
  override public function update(elapsed:Float) {
    if (controls.BACK && inExtraScreen)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			FlxG.switchState(new MainMenuState());
		}
  }
}
