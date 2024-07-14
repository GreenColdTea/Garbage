local curGameOver = ''

local songsState = 0

function onGameOverStart()
   runTimer('CHLyrics', 2.5)
end

function onUpdate()
    if getProperty('dad.curCharacter') == 'starved' then
        --setPropertyFromClass('GameOverSubstate','characterName','bf-starved-die')
        setPropertyFromClass('GameOverSubstate','deathSoundName','starved-death')
        setPropertyFromClass('GameOverSubstate','loopSoundName','starved-gameover')
        setPropertyFromClass('GameOverSubstate','endSoundName','starved-retry')
        curGameOver = 'starved'
    end
    if getProperty('boyfriend.curCharacter') == 'bf-fatal' then
        setPropertyFromClass('GameOverSubstate','characterName','bf-fatal-death')
        setPropertyFromClass('GameOverSubstate','deathSoundName','fatal-death')
        setPropertyFromClass('GameOverSubstate','loopSoundName','starved-loop')
        curGameOver = 'fatal'
    end
    if getProperty('dad.curCharacter') == 'sonicexe' then
       function onTimerCompleted(tag)
         if tag == 'CHLyrics' then
         math.randomseed(os.time())
         local randomNumber = math.random(1, 10)
         if randomNumber == 1 then 
            playSound('VoiceLines/XenoTSLines/1');
    
          elseif randomNumber == 2 then 
             playSound('VoiceLines/XenoTSLines/2');

          elseif randomNumber == 3 then 
             playSound('VoiceLines/XenoTSLines/3');

          elseif randomNumber == 4 then 
             playSound('VoiceLines/XenoTSLines/4');

          elseif randomNumber == 5 then 
             playSound('VoiceLines/XenoTSLines/5');

          elseif randomNumber == 6 then 
             playSound('VoiceLines/XenoTSLines/6');

          elseif randomNumber == 7 then 
             playSound('VoiceLines/XenoTSLines/7');

          elseif randomNumber == 8 then 
             playSound('VoiceLines/XenoTSLines/8');

          elseif randomNumber == 9 then 
             playSound('VoiceLines/XenoTSLines/9');

          elseif randomNumber == 10 then 
             playSound('VoiceLines/XenoTSLines/10');
          end
        end
      end
    end
    if getProperty('boyfriend.curCharacter') == 'bf-needle' then
        setPropertyFromClass('GameOverSubstate','characterName','bf-needle-die')
        setPropertyFromClass('GameOverSubstate','loopSoundName','needlemouse-loop')
        setPropertyFromClass('GameOverSubstate','endSoundName','needlemouse-retry')
        
        curGameOver = 'needle'
    end
    if getProperty('boyfriend.curCharacter') == 'bf-running-sonic' or getProperty('boyfriend.curCharacter') == 'bf-Sonic-Peelout' then
        setPropertyFromClass('GameOverSubstate','deathSoundName','prey-death')
        setPropertyFromClass('GameOverSubstate','loopSoundName','prey-loop')
        setPropertyFromClass('GameOverSubstate','endSoundName','prey-retry')
        curGameOver = 'prey'
    end
    if songsState == 1 and curGameOver == 'prey' then
        if getProperty('boyfriend.animation.curAnim.curFrame') == 15 then
            playSound('SonicDash')
            songsState = 2
        end
    end
end
function onGameOverConfirm()
    if songsState == 0 and curGameOver == 'prey' then
        playSound('SonicJump')
        songsState = 1
    end
end