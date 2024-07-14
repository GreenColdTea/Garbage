local zoom = 1;

function onCreate()
	-- background shit
   debugMode = true
	precacheImage('chaotix/new_horizon/floor')
	precacheImage('chaotix/new_horizon/amy_bopper')
	precacheImage('chaotix/new_horizon/charmy_bopper')
	precacheImage('chaotix/new_horizon/espio_bopper')
	precacheImage('chaotix/new_horizon/knuckles_bopper')
	precacheImage('chaotix/new_horizon/mighty_bopper')
	precacheImage('chaotix/new_horizon/starline')
	precacheImage('chaotix/new_horizon/trees')
	precacheImage('chaotix/new_horizon/trees2')
	precacheImage('chaotix/new_horizon/vector_bopper')
	precacheImage('chaotix/firework/pink_firework')
	precacheImage('chaotix/firework/red_firework')
	precacheImage('chaotix/firework/yellow_firework')
	
	makeLuaSprite('cheese', 'chaotix/horizonsky', -1200, -50);
	setScrollFactor('cheese', 0.85, 0.85);
	scaleObject('cheese', 1, 1);
	setProperty('cheese.antialiasing', false)

   runHaxeCode([[
      isPixelStage = true;
  ]])
	
	makeLuaSprite('d', 'chaotix/horizonFg', -215, 75)
	setScrollFactor('d', 1, 1)
	scaleObject('d', 1, 1)
	
	makeAnimatedLuaSprite('amy-horizon', 'chaotix/BG_amy', 1370, 1269);
	scaleObject('amy-horizon', 5.8, 5.9);
	addAnimationByPrefix('amy-horizon', 'amyispregnant', 'amy bobbing', 26, true);
	setProperty('amy-horizon.antialiasing', false);
	
	makeAnimatedLuaSprite('espio-horizon', 'chaotix/BG_espio', 1600, 1335);
	scaleObject('espio-horizon', 5.6, 5.6);
	addAnimationByPrefix('espio-horizon', 'espioiscool', 'espio bobbing', 26, true);
	setProperty('espio-horizon.antialiasing', false);

	makeAnimatedLuaSprite('knuckles-horizon', 'chaotix/BG_knuckles', 150, 1260);
	scaleObject('knuckles-horizon', 6.1, 6.1);
	addAnimationByPrefix('knuckles-horizon', 'knucklesknowdawae', 'knuckles bobbing', 26, true);
	setProperty('knuckles-horizon.antialiasing', false)

	makeAnimatedLuaSprite('vector-horizon', 'chaotix/BG_vector', -50, 1244);
	scaleObject('vector-horizon', 6.1, 6.1);
	addAnimationByPrefix('vector-horizon', 'vectorhaotiks', 'vector bobbing', 26, true);
	setProperty('vector-horizon.antialiasing', false)
	
	makeAnimatedLuaSprite('mighty-horizon', 'chaotix/BG_mighty', 760, 1285);
	scaleObject('mighty-horizon', 6.1, 6.1);
	addAnimationByPrefix('mighty-horizon', 'helpmemighty', 'mighty bobbing', 26, true);
	setProperty('mighty-horizon.antialiasing', false)

	makeAnimatedLuaSprite('charmy-horizon', 'chaotix/BG_charmy', 1200, 1150);
	scaleObject('charmy-horizon', 6.1, 6.1)
	addAnimationByPrefix('charmy-horizon', 'smallcharmy', 'charmy bobbing', 26, true);
	setProperty('charmy-horizon.antialiasing', false)

   addLuaSprite('cheese', false);
   addLuaSprite('d', false);
	addLuaSprite('amy-horizon', false);
	addLuaSprite('espio-horizon', false);
	addLuaSprite('knuckles-horizon', false);
	addLuaSprite('vector-horizon', false);
	addLuaSprite('mighty-horizon', false);
	addLuaSprite('charmy-horizon', false);
end

function onStepHit()
	if curStep == 10 then
		doTweenAlpha('camHUD', 'camHUD', 1, 1)
	end
   if curStep == 765 then
     doTweenAlpha('dedhud', 'camHUD', 0, 1.2, 'linear')
   end
	if curStep == 800 then
      doTweenZoom('Change Camera Zoom', 'camGame', 1.4, 12, 'cubeInOut')
	end
	if curStep == 822 then
	   doTweenAlpha('CAl', 'cheese', 0, 3.25, 'linear')
		doTweenAlpha('KN', 'knuckles-horizon', 0, 3.25, 'linear')
		doTweenAlpha('vectorgone', 'vector-horizon', 0, 3.25, 'linear')
		doTweenAlpha('espio', 'espio-horizon', 0, 3.25, 'linear')
		doTweenAlpha('MIGH', 'mighty-horizon', 0, 3.25, 'linear')
		doTweenAlpha('imy', 'amy-horizon', 0, 3.25, 'linear')
		doTweenAlpha('chars', 'charmy-horizon', 0, 3.25, 'linear')
		doTweenAlpha('b', 'd', 0, 3.25, 'linear')
	end
  if curStep == 922 then
    cancelTween('Change Camera Zoom')
  end
  if curStep == 923 then
    doTweenAlpha('CHAOTIKS', 'dadGroup', 0, 0.5, 'linear')
    doTweenAlpha('Bfdied','boyfriend', 0, 0.5, 'linear')
    doTweenAlpha('gfChponk', 'gf', 0, 0.5, 'linear')
    noteTweenX("NoteMove1", 0, -1000, 0.5, cubeInOut)
	 noteTweenX("NoteMove2", 1, -1000, 0.5, cubeInOut)
	 noteTweenX("NoteMove3", 2, -1000, 0.5, cubeInOut)
    noteTweenX("NoteMove4", 3, -1000, 0.5, cubeInOut)
  end
  if curStep == 1000 then
    setProperty('defaultCamZoom', 0.75)
  end
  if curStep <= 1007 then
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-chaotix-death');
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'chaotix-death');
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver');
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'chaotix-retry'); 
  end
  if curStep >= 2337 and curStep <= 2849 then
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-chaotix-death');
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'chaotix-death');
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'chaotix-loop');
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'chaotix-retry'); 
  end
  
  if curStep >= 1009 then
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-holding-gf-dead');
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf-loss-sfx');
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOverOG');
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEndOG'); 
  end
  if curStep >= 2850 then
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-holding-gf-dead');
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf-loss-sfx');
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOverOG');
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEndOG'); 
  end
  if curStep == 1003 then
    setProperty('boyfriend.alpha', 1)
    setProperty('dad.alpha', 1)
    setProperty('camHUD.alpha', 1)
    makeLuaSprite('flor', 'chaotix/new_horizon/floor', -400, 550)
    scaleObject('flor', 1, 1)
    
    makeLuaSprite('sky', 'chaotix/new_horizon/starline', -350, 550)
    scaleObject('sky', 1, 1)
    addLuaSprite('sky', false)

    makeAnimatedLuaSprite('red', 'chaotix/firework/red_firework', 450, 550)
    scaleObject('red', 1, 1)
    setProperty('red.alpha', 0)
    addLuaSprite('red', false)

    makeAnimatedLuaSprite('yellow', 'chaotix/firework/yellow_firework', 850, 550)
    scaleObject('yellow', 1, 1)
    setProperty('yellow.alpha', 0)
    addLuaSprite('yellow', false)

    makeAnimatedLuaSprite('pink', 'chaotix/firework/pink_firework', -50, 550)
    scaleObject('pink', 1, 1)
    setProperty('pink.alpha', 0)
    addLuaSprite('pink', false)
    addLuaSprite('flor', false)

    makeLuaSprite('AhhTrees', 'chaotix/new_horizon/trees', -600, 400)
    scaleObject('AhhTrees', 1.25, 1.25)
    addLuaSprite('AhhTrees', false)

    makeLuaSprite('AhhTrees2', 'chaotix/new_horizon/trees2', -300, 525)
    scaleObject('AhhTrees2', 1, 1)

    makeAnimatedLuaSprite('amy', 'chaotix/new_horizon/amy_bopper', 1200, 900)
    scaleObject('amy', 0.5, 0.5)
    addAnimationByPrefix('amy', 'amyBopping', 'amy bopper instance', 24, true)
    addLuaSprite('amy', false)

    makeAnimatedLuaSprite('charmy', 'chaotix/new_horizon/charmy_bopper', 900, 540)
    scaleObject('charmy', 0.5, 0.5)
    addAnimationByPrefix('charmy', 'charmyBopping', 'charmy bopper', 24, true)
    addLuaSprite('charmy', true)
    addLuaSprite('AhhTrees2', false)

    makeAnimatedLuaSprite('espio', 'chaotix/new_horizon/espio_bopper', 100, 900)
    scaleObject('espio', 0.5, 0.5)
    addAnimationByPrefix('espio', 'espioBopping', 'espio bopper instance', 24, true)
    addLuaSprite('espio', false)

    makeAnimatedLuaSprite('mighty', 'chaotix/new_horizon/mighty_bopper', 900, 900)
    scaleObject('mighty', 0.5, 0.5)
    addAnimationByPrefix('mighty', 'mightyBopping', 'mighty bopper', 24, true)
    addLuaSprite('mighty')

    makeAnimatedLuaSprite('knuckles', 'chaotix/new_horizon/knuckles_bopper', -300, 1200)
    scaleObject('knuckles', 0.9, 0.9)
    addAnimationByPrefix('knuckles', 'knucklesBopping', 'knuckles bopper instance', 24, true)
    addLuaSprite('knuckles', true)

    makeAnimatedLuaSprite('vector', 'chaotix/new_horizon/vector_bopper', 1050, 1150)
    scaleObject('vector', 0.9, 0.9)
    addAnimationByPrefix('vector', 'vectorBopping', 'vector bopper', 24, true)
    addLuaSprite('vector', true)
   end
	if curStep == 2336 then
      setProperty('dadGroup.x', 440);
      setProperty('gf.alpha', 1);
		setProperty('dadGroup.y', 885);
      setProperty('cheese.alpha', 1);
      setProperty('d.alpha', 1);
      setProperty('amy-horizon.alpha', 1);
	   setProperty('espio-horizon.alpha', 1);
   	setProperty('knuckles-horizon.alpha', 1);
	   setProperty('vector-horizon.alpha', 1);
	   setProperty('mighty-horizon.alpha', 1);
	   setProperty('charmy-horizon.alpha', 1);
      setProperty('amy.alpha', 0);
	   setProperty('espio.alpha', 0);
   	setProperty('knuckles.alpha', 0);
	   setProperty('vector.alpha', 0);
	   setProperty('mighty.alpha', 0);
	   setProperty('charmy.alpha', 0);
      setProperty('knuckles.alpha', 0);
	   setProperty('vector.alpha', 0);
      setProperty('flor.alpha', 0);
      setProperty('sky.alpha', 0);
      setProperty('AhhTrees.alpha', 0);
      setProperty('defaultCamZoom', 0.92)
      setProperty('AhhTrees2.alpha', 0);
	end
   if curStep >= 2335 and curStep <= 2847 then
	    if zoom == 1 then
		   if mustHitSection == false then
			   setProperty('defaultCamZoom',1.19)
		 else
			   setProperty('defaultCamZoom',0.9)
		  end
	   end
   end
   if curStep == 2848 then
      setProperty('dadGroup.x', 340);
      setProperty('gf.alpha', 0);
		setProperty('dadGroup.y', 950);
      setProperty('cheese.alpha', 0);
      setProperty('d.alpha', 0);
      setProperty('amy-horizon.alpha', 0);
	   setProperty('espio-horizon.alpha', 0);
   	setProperty('knuckles-horizon.alpha', 0);
	   setProperty('vector-horizon.alpha', 0);
	   setProperty('mighty-horizon.alpha', 0);
	   setProperty('charmy-horizon.alpha', 0);
      setProperty('amy.alpha', 1);
	   setProperty('espio.alpha', 1);
   	setProperty('knuckles.alpha', 1);
	   setProperty('vector.alpha', 1);
	   setProperty('mighty.alpha', 1);
	   setProperty('charmy.alpha', 1);
      setProperty('knuckles.alpha', 1);
	   setProperty('vector.alpha', 1);
      setProperty('flor.alpha', 1);
      setProperty('sky.alpha', 1);
      setProperty('AhhTrees.alpha', 1);
      setProperty('AhhTrees2.alpha', 1);
      setProperty('defaultCamZoom', 0.75)
    end
    if curStep == 2992 then
      doTweenAlpha('dedhud', 'camHUD', 0, 0.9, 'linear')
    end
    if curStep == 3007 then
      addAnimationByPrefix('red', 'redFire', 'red firework', 8, true)
      setProperty('red.alpha', 1)
    end
    if curStep == 3024 then
      addAnimationByPrefix('yellow', 'yellowFire', 'yellow firework', 8, true)
      setProperty('yellow.alpha', 1)
    end
    if curStep == 3056 then
      addAnimationByPrefix('pink', 'pinkFire', 'pink firework', 8, true)
      setProperty('pink.alpha', 1)
    end
    if curStep == 3104 then
      setProperty('pink.alpha', 0);
      setProperty('yellow.alpha', 0);
      setProperty('red.alpha', 0);
      setProperty('gf.alpha', 0);
      setProperty('dad.alpha', 0);
      setProperty('boyfriend.alpha', 0);
      setProperty('amy.alpha', 0);
	   setProperty('espio.alpha', 0);
   	setProperty('knuckles.alpha', 0);
	   setProperty('vector.alpha', 0);
	   setProperty('mighty.alpha', 0);
	   setProperty('charmy.alpha', 0);
      setProperty('knuckles.alpha', 0);
	   setProperty('vector.alpha', 0);
      setProperty('flor.alpha', 0);
      setProperty('sky.alpha', 0);
      setProperty('AhhTrees.alpha', 0);
      setProperty('AhhTrees2.alpha', 0);
	end
end
function onSongStart()
	setProperty('camHUD.alpha',0)
end