local time = 0
local continueTime = 0
local enableCount = false

function onCreate()
   setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-exe-death'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music
	
  if songName == 'too-slow' or songName == 'you-cant-run' or songName == 'triple-trouble' or songName == 'too-slow-encore' or songName == 'you-cant-run-encore' or songName == 'triple-trouble-encore' then
    precacheImage('gameovers/DeathScreenSonicExe')
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-exe-death'); --Character json file for the death animation
	 setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'exe_gameOver'); --put in mods/music/
	 setPropertyFromClass('GameOverSubstate', 'endSoundName', 'exe_gameOverEnd'); --put in mods/music/
    function onGameOverStart()
      local bfX = getProperty('boyfriend.x')
      local bfY = getProperty('boyfriend.y')
      local bfOffsetX = getProperty('boyfriend.offset.x')
      local bfOffsetY = getProperty('boyfriend.offset.y')
      local camX = getProperty('camFollow.x')
      local camY = getProperty('camFollow.y')

      runTimer('lopinTime', 2.5);
      makeAnimatedLuaSprite('SonixEXE', 'gameovers/DeathScreenSonicExe', 625, -150);
      addAnimationByPrefix('SonixEXE', 'apeare', 'appear', 24, false);
      addAnimationByPrefix('SonixEXE', 'cumfirm', 'deathConfirmSonicExe instance ', 24, false);
      addAnimationByPrefix('SonixEXE', 'loping', 'deathLoopSonicExe instance ', 24, true);
      setObjectCamera('SonixEXE', 'game')
      setProperty('SonixEXE.x', bfX + bfOffsetX - camX + 825) -- 100 - смещение по оси X, чтобы спрайт был позади
      setProperty('SonixEXE.y', bfY + bfOffsetY - camY + 100)
      scaleObject('SonixEXE', 1.5, 1.5);
      --setScrollFactor('SonixEXE', 0, 0);
      addLuaSprite('SonixEXE', false);
      objectPlayAnimation('SonixEXE', 'apeare', false);
      function onTimerCompleted(tag)
        if tag == 'lopinTime' then
           objectPlayAnimation('SonixEXE', 'loping', true);
           setProperty('SonixEXE.y', bfY + bfOffsetY - camY + 125)
          -- setProperty('SonixEXE.x', 625);
          -- setProperty('SonixEXE.y', -125);
        end
      end
      function onGameOverConfirm()
        setProperty('SonixEXE.x', bfX + bfOffsetX - camX + 870)
        setProperty('SonixEXE.y', bfY + bfOffsetY - camY + 150)
        objectPlayAnimation('SonixEXE', 'cumfirm', false)
        --setProperty('SonixEXE.y', -90);
        --setProperty('SonixEXE.x', 650);
        runTimer('fadeAllRed', 0.09);
        function onTimerCompleted(tag)
          if tag == 'fadeAllRed' then
            makeLuaSprite('flash', '', 0, 0);
            makeGraphic('flash', 1280, 720, 'ff0000')
            addLuaSprite('flash', true);
            setLuaSpriteScrollFactor('flash', 0, 0)
            setProperty('flash.scale.x', 2)
            setProperty('flash.scale.y', 2)
            setProperty('flash.alpha', 1)
            setObjectCamera('flash', 'camHUD')
            doTweenAlpha('flT', 'flash', 0, 2.2, 'linear')
            removeLuaSprite('SonixEXE')
            setProperty('boyfriend.visible', false)
          end
        end
      end
    end
  end
  if songName == 'final-escape' then
	 setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'finalescape-gameover'); --put in mods/music/
	 setPropertyFromClass('GameOverSubstate', 'endSoundName', 'finalescape-retry'); --put in mods/music/
  end
  if songName == 'oxxynless' then
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'oxxy-death');
 	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'oxxy-gameover'); --put in mods/music/
	 setPropertyFromClass('GameOverSubstate', 'endSoundName', 'oxxy-retry');
  end
  if songName == 'found-you' then
	 setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'normalcd-gameover'); --put in mods/music/
	 setPropertyFromClass('GameOverSubstate', 'endSoundName', 'normalcd-retry'); --put in mods/music/
  end
  if songName == 'ugly' then
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'ugly-death');
 	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'ugly-gameover'); --put in mods/music/
	 setPropertyFromClass('GameOverSubstate', 'endSoundName', 'ugly-retry'); --put in mods/music
  end
  if songName == 'frenzy' then
    setPropertyFromClass('GameOverSubstate', 'characterName', 'lumpy-bf-gameover');
  end
  if getPropertyFromClass('PlayState', 'curStage') == 'monoStage' then
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'mono-gameover')
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'mono-retry')
  end
  if getPropertyFromClass('PlayState','curStage') == 'nature' then
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-sonichu-death'); --Character json file for the death animation
	 setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'sonichu-death'); --put in mods/sounds/
	 setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'sonichu-gameover'); --put in mods/music/
 	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'sonichu-retry'); --put in mods/music
  end
  if getPropertyFromClass('PlayState', 'curStage') == 'christmas' then
    setPropertyFromClass('GameOverSubstate', 'characterName', 'sonicexe_christmas'); --Character json file for the death animation
	 setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'christmas-gameover'); --put in mods/music/
 	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'christmas-retry'); --put in mods/music
  end
  if songName == 'cycles' or songName == 'execution-inski' or songName == 'fate' or songName == 'fate-remix' or songName == 'hellbent' or songName == 'execution' or songName == 'judgement' then
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'silent')
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'lordx-gameover');
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'lordx-retry');
    function onGameOverStart()
       precacheImage('gameovers/LordXGameOver')
       runTimer('CAppear', 2.5)
       makeAnimatedLuaSprite('Credits', 'gameovers/LordXGameOver', 50, 0)
       addAnimationByPrefix('Credits', 'meditation', 'Loop', 24, true)
       addAnimationByPrefix('Credits', 'meditationR', 'Retry', 24, false)
       setProperty('Credits.alpha', 0)
       setObjectCamera('Credits', 'camHUD')
       objectPlayAnimation('Credits', 'meditation', true)
       scaleObject('Credits', 1, 1)
       setScrollFactor('Credits', 0, 0)
       addLuaSprite('Credits', false)
     --screenCenter('Credits')
       setProperty('boyfriend.visible', false)
    end
    function onTimerCompleted(tag)
       if tag == 'CAppear' then
         doTweenAlpha('CAlpha', 'Credits', 1, 2.5, 'linear')
       end
    end
    function onDestroy()
       cancelTween('CAlpha')
    end
    function onGameOverConfirm()
       setProperty('Credits.x', -375)
       setProperty('Credits.y', 35)
       objectPlayAnimation('Credits', 'meditationR', false)
    end
  end
  if songName == 'cycles-encore' then
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'encorelordx-gameover')
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'lordx-retry')
    function onGameOverStart()
       runTimer('XAppear', 2)
       setProperty('boyfriend.visible', false)
       makeAnimatedLuaSprite('meditationEN', 'gameovers/lord-x-encore', 220, 150)
       addAnimationByPrefix('meditationEN', 'animX', 'idle', 24, true)
       addAnimationByPrefix('meditationEN', 'AnimResetX', 'reset', 24, false)
       setObjectCamera('meditationEN', 'camHUD')
       setProperty('meditationEN.alpha', 0)
       scaleObject('meditationEN', 1, 1)
       setScrollFactor('meditationEN', 0, 0)
       addLuaSprite('meditationEN', false)
       objectPlayAnimation('meditationEN', 'animX', true)
    end
    function onGameOverConfirm()
       objectPlayAnimation('meditationEN', 'AnimResetX', false)
       setProperty('meditationEN.x', 133)
       setProperty('meditationEN.y', 57)
    end
    function onTimerCompleted(tag)
       if tag == 'XAppear' then
         doTweenAlpha('xA', 'meditationEN', 1, 2.5, 'linear')
       end
    end
    function onDestroy()
       cancelTween('xA')
    end
  end
  if songName == 'personel' then
    function onGameOverStart()
       setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'coldsteel-gameover'); --put in mods/music/
    	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'coldsteel-gameover-retry'); --put in mods/music
       runTimer('cryBaby', 2.5)
       makeLuaSprite('WannaCry', 'gameovers/coldsteel', 0, 0)
       setScrollFactor('WannaCry', 0, 0)
       scaleObject('WannaCry', 1, 1)
       setProperty('WannaCry.alpha', 0)
       screenCenter('WannaCry')
       setProperty('boyfriend.visible', 0)
       addLuaSprite('WannaCry', false)
    function onTimerCompleted(tag)
       if tag == 'cryBaby' then
         doTweenAlpha('Cryin', 'WannaCry', 1, 2.5, 'linear')
       end
    end
    function onDestroy()
       cancelTween('Cryin')
    end
    end
  end
  if songName == 'B4CKSL4SH' then
     setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-slash-death'); --Character json file for the death animation
  	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'slash-death'); --put in mods/sounds/
	  setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'slash-gameover'); --put in mods/music/
	  setPropertyFromClass('GameOverSubstate', 'endSoundName', 'slash-retry'); --put in mods/music
  end
  if songName == 'old-ycr-slaps' then
     setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'xenoslaps-death'); --put in mods/sounds/
  	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'xenoslaps-gameover'); --put in mods/music/
	  setPropertyFromClass('GameOverSubstate', 'endSoundName', 'xenoslaps-retry');
  end
  if songName == 'her-world-encore' then
     setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'sunter-gameover');
     setPropertyFromClass('GameOverSubstate', 'endSoundName', 'sunter-retry');
  end
  if songName == 'personel-serious' then
	  setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'silent'); --put in mods/sounds/
	  setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'silent'); --put in mods/music/
	  setPropertyFromClass('GameOverSubstate', 'endSoundName', 'silent'); --put in mods/music
  function onGameOverStart()
     setProperty('boyfriend.visible', false)
     runTimer('PS-RETRY', 2.25)
  end
    function onGameOver()
      local randomVideo = getRandomInt(1, 5)
      if randomVideo == 1 then 
          startVideo('PersonelSeriousGameOvers/1')
    
      elseif randomVideo == 2 then 
          startVideo('PersonelSeriousGameOvers/2')

      elseif randomVideo == 3 then 
          startVideo('PersonelSeriousGameOvers/3')

      elseif randomVideo == 4 then 
           startVideo('PersonelSeriousGameOvers/4')

      elseif randomVideo == 5 then 
           startVideo('PersonelSeriousGameOvers/Secret')

      end
      function onTimerCompleted(tag)
         if tag == 'PS-RETRY' then
            loadSong('personel-serious', 'hard')
        end
      end
    end
  end
  if songName == 'forestall-desire' then
  	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'requital-death'); --put in mods/sounds/
  	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'requital-gameover'); --put in mods/music/
  	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'requital-retry'); --put in mods/music
  	
  	function onGameOverStart()
  	 time = 19
      enableCount = true
      setProperty('boyfriend.visible', false)
      precacheImage('gameovers/requital/bf-pico')
  	 precacheImage('gameovers/requital/numbers')
  	 precacheImage('gameovers/requital/continue-stars')
      precacheSound('rq-bf-count')
      precacheSound('rq-bf-count-end')
      makeLuaSprite('deadheads', 'gameovers/requital/bf-pico', 0, 0)
      scaleObject('deadheads', 1.25, 1.25)
      setScrollFactor('deadheads', 0, 0)
      screenCenter('deadheads')
      addLuaSprite('deadheads', false)
      setProperty('deadheads.alpha', 0)
      
      makeLuaSprite('countStars', 'gameovers/requital/continue-stars', 190, 40)
      scaleObject('countStars', 0.7, 0.7)
      setScrollFactor('countStars', 0, 0)
      setObjectCamera('countStars', 'camHUD')
      addLuaSprite('countStars', false)
      setProperty('countStars.alpha', 0)
      
      makeAnimatedLuaSprite('num', 'gameovers/requital/numbers', 607.5, 300)
      scaleObject('num', 0.75, 0.75)
      setScrollFactor('num', 0, 0)
      setObjectCamera('num', 'camHUD')
      addLuaSprite('num', false)
      setProperty('num.alpha', 0)
  	end
  	
  	function onGameOverConfirm()
  	  enableCount = false
       removeLuaSprite('num')
  	end
  
    function onUpdate(el)
      if enableCount then
        time = time - el
        if math.floor(time) ~= continueTime then
              continueTime = math.floor(time)
  
              if continueTime == 15 then
                setProperty('deadheads.alpha', 1)
              elseif continueTime == 14 then 
                setProperty('countStars.alpha', 1)
              elseif continueTime == 13
                then
                setProperty('num.alpha', 1)
                addAnimationByPrefix('num', 'tick', 'num', 1, false)
                playSound('rq-bf-count')
              elseif continueTime == 12 then
                playSound('rq-bf-count')
              elseif continueTime == 11 then
                playSound('rq-bf-count')
              elseif continueTime == 10 then
                playSound('rq-bf-count')
              elseif continueTime == 9 then
                playSound('rq-bf-count')
              elseif continueTime == 8 then
                playSound('rq-bf-count')
              elseif continueTime == 7 then
                playSound('rq-bf-count')
              elseif continueTime == 6 then
                playSound('rq-bf-count')
              elseif continueTime == 5 then
                playSound('rq-bf-count')
              elseif continueTime == 4 then
                playSound('rq-bf-count')
              elseif continueTime == 3 then
                playSound('rq-bf-count-end')
                return Function_Stop
              elseif continueTime == 2 then
                playSound('rq-bf-count-end')
                removeLuaSprite('num')
              elseif continueTime == 1 then
                playSound('rq-bf-count-end')
                removeLuaSprite('deadheads')
                removeLuaSprite('countStars')
              elseif continueTime == 0 then
                os.exit(false,true)
              end
           end
        end
     end
  end
end