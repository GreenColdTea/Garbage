package;

import Conductor.BPMChangeEvent;
import flixel.FlxG;
import flixel.addons.ui.FlxUIState;
import flixel.math.FlxRect;
import flixel.util.FlxTimer;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxGradient;
import flixel.FlxState;
import flixel.FlxBasic;
import openfl.Lib;
import flixel.system.scaleModes.RatioScaleMode;
#if android
import flixel.input.actions.FlxActionInput;
import android.AndroidControls.AndroidControls;
import android.FlxVirtualPad;
import flixel.FlxCamera;
import flixel.util.FlxDestroyUtil;
#end

class MusicBeatState extends FlxUIState
{
	private var lastBeat:Float = 0;
	private var lastStep:Float = 0;

	private var curStep:Int = 0;
	private var curBeat:Int = 0;

	public var curDecStep:Float = 0;
	public var curDecBeat:Float = 0;
	private var controls(get, never):Controls;

	inline function get_controls():Controls
		return PlayerSettings.player1.controls;

	#if android
	var _virtualpad:FlxVirtualPad;
	var androidc:AndroidControls;
	var trackedInputsHitbox:Array<FlxActionInput> = [];
	var trackedInputsMobileControls:Array<FlxActionInput> = [];
	var trackedInputsVirtualPad:Array<FlxActionInput> = [];
	#end
	
	#if android
	public function addVirtualPad(?DPad:FlxDPadMode, ?Action:FlxActionMode) {
		_virtualpad = new FlxVirtualPad(DPad, Action, 0.75, ClientPrefs.globalAntialiasing);
		add(_virtualpad);
		controls.setVirtualPadUI(_virtualpad, DPad, Action);
		trackedInputsVirtualPad = controls.trackedinputsUI;
		controls.trackedinputsUI = [];
	}
	#end


	public function removeVirtualPad()
	{
		if (trackedInputsVirtualPad.length > 0) {
			controls.removeVirtualControlsInput(trackedInputsVirtualPad);
		}

		if (virtualPad != null) {
			remove(virtualPad);
		}
	}

	public function addMobileControls(usesDodge:Bool = false, DefaultDrawTarget:Bool = true)
	{
		androidc = new AndroidControls();

		switch (androidc.mode)
		{
			case VIRTUALPAD_RIGHT:
				controls.setVirtualPadNOTES(androidc.vpad, RIGHT_FULL, NONE);
			case VIRTUALPAD_LEFT:
				controls.setVirtualPadNOTES(androidc.vpad, LEFT_FULL, NONE);
			case VIRTUALPAD_CUSTOM:
				controls.setVirtualPadNOTES(androidc.vpad, RIGHT_FULL, NONE);
			case DUO:
				controls.setVirtualPadNOTES(androidc.vpad, DUO, NONE);
			case HITBOX:
			   if(ClientPrefs.hitboxmode != 'New'){
				controls.setHitBox(androidc.hbox);
				}else{
				controls.setNewHitBox(androidc.newhbox);
				}
			default:
		}

		trackedinputsMobileControls = controls.trackedinputsNOTES;
		controls.trackedinputsNOTES = [];

		var camControls:FlxCamera = new FlxCamera();
		FlxG.cameras.add(camControls, DefaultDrawTarget);
		camControls.bgColor.alpha = 0;

		mobileControls.cameras = [camControls];
		mobileControls.visible = false;
		add(mobileControls);
	}

	public function removeMobileControls()
	{
		if (trackedInputsMobileControls.length > 0) {
			controls.removeVirtualControlsInput(trackedInputsMobileControls);
		}

		if (mobileControls != null) {
			remove(mobileControls);
		}
	}

	public function addVirtualPadCamera() {
		var camcontrol = new flixel.FlxCamera();
		camcontrol.bgColor.alpha = 0;
		FlxG.cameras.add(camcontrol, false);
		_virtualpad.cameras = [camcontrol];
	}

	public function addHitbox(?usesDodge = false):Void
	{
		if (hitbox != null) {
			removeHitbox();
		}

		if (usesDodge) {
			hitbox = new FlxHitbox(SPACE);
			hitbox.visible = visible;
			add(hitbox);
			hitboxDiff = SPACE;
		} else {
			hitbox = new FlxHitbox(DEFAULT);
			hitbox.visible = visible;
			hitboxDiff = DEFAULT;
		}

		controls.setHitBox(hitbox, hitboxDiff);
		trackedInputsHitbox = controls.trackedinputsNOTES;
		controls.trackedInputsNOTES = [];
	}

	public function addHitboxCamera(DefaultDrawTarget:Bool = true):Void
	{
		if (hitbox != null)
		{
			var camControls:FlxCamera = new FlxCamera();
			FlxG.cameras.add(camControls, DefaultDrawTarget);
			camControls.bgColor.alpha = 0;
			hitbox.cameras = [camControls];
		}
	}

	public function removeHitbox():Void
	{
		if (trackedInputsHitbox.length > 0) {
			controls.removeVirtualControlsInput(trackedInputsHitbox);
		}

		if (hitbox != null) {
			remove(hitbox);
		}
	}
	#end

	override function destroy()
	{
		#if android
		if (trackedInputsHitbox.length > 0) {
			controls.removeVirtualControlsInput(trackedInputsHitbox);
		}

		if (trackedInputsMobileControls.length > 0) {
			controls.removeVirtualControlsInput(trackedInputsMobileControls);
		}

		if (trackedInputsVirtualPad.length > 0) {
			controls.removeVirtualControlsInput(trackedInputsVirtualPad);
		}
		#end

		super.destroy();

		#if android
		if (virtualPad != null) {
			virtualPad = FlxDestroyUtil.destroy(virtualPad);
		}

		if (mobileControls != null) {
			mobileControls = FlxDestroyUtil.destroy(mobileControls);
		}

		if (hitbox != null) {
			hitbox = FlxDestroyUtil.destroy(hitbox);
			}
		#end
	}

	override function create() {

		super.create();

	}

	override function update(elapsed:Float)
	{
		//everyStep();
		var oldStep:Int = curStep;

		updateCurStep();
		updateBeat();

		if (oldStep != curStep)
		{
			if(curStep > 0)
				stepHit();

			if(PlayState.SONG != null)
			{
				if (oldStep < curStep)
					updateSection();
				else
					rollbackSection();
			}
		}

		if(FlxG.save.data != null) FlxG.save.data.fullscreen = FlxG.fullscreen;

		super.update(elapsed);
	}

	private function updateBeat():Void
	{
		curBeat = Math.floor(curStep / 4);
		curDecBeat = curDecStep/4;
	}

	private function updateCurStep():Void
	{
		var lastChange:BPMChangeEvent = {
			stepTime: 0,
			songTime: 0,
			bpm: 0
		}
		for (i in 0...Conductor.bpmChangeMap.length)
		{
			if (Conductor.songPosition >= Conductor.bpmChangeMap[i].songTime)
				lastChange = Conductor.bpmChangeMap[i];
		}

		var shit = ((Conductor.songPosition - ClientPrefs.noteOffset) - lastChange.songTime) / Conductor.stepCrochet;
		curDecStep = lastChange.stepTime + shit;
		curStep = lastChange.stepTime + Math.floor(shit);
	}

        public static function switchState(nextState:FlxState) {
		// Custom made Trans in
		var curState:Dynamic = FlxG.state;
		var leState:MusicBeatState = curState;
		if(!FlxTransitionableState.skipNextTransIn) {
			leState.openSubState(new CustomFadeTransition(0.6, false));
			if(nextState == FlxG.state) {
				CustomFadeTransition.finishCallback = function() {
					FlxG.resetState();
				};
				//trace('resetted');
			} else {
				CustomFadeTransition.finishCallback = function() {
					FlxG.switchState(nextState);
				};
				//trace('changed state');
			}
			return;
		}
		FlxTransitionableState.skipNextTransIn = false;
		FlxG.switchState(nextState);
	}
	
	public static function resetState() {
		FlxG.resetState();
	}

	private function updateSection():Void
	{
		if(stepsToDo < 1) stepsToDo = Math.round(getBeatsOnSection() * 4);
		while(curStep >= stepsToDo)
		{
			curSection++;
			var beats:Float = getBeatsOnSection();
			stepsToDo += Math.round(beats * 4);
			sectionHit();
		}
	}

	public static function getState():MusicBeatState {
		var curState:Dynamic = FlxG.state;
		var leState:MusicBeatState = curState;
		return leState;
	}

	public function stepHit():Void
	{
		if (curStep % 4 == 0)
			beatHit();
	}

	public function beatHit():Void
	{
		//do literally nothing dumbass
	}

	function getBeatsOnSection()
	{
		var val:Null<Float> = 4;
		if(PlayState.SONG != null && PlayState.SONG.notes[curSection] != null) val = PlayState.SONG.notes[curSection].sectionBeats;
		return val == null ? 4 : val;
	}
}
