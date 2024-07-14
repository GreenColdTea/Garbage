function onCreate()
    function onGameOverStart()
       runTimer('CHLyrics', 2.5)
       runTimer('wechBeastLyrics', 1.4)
    end
    
    if songName == 'long-sky-old' or songName == 'long-sky' then
        function onTimerCompleted(tag)
           if tag == 'CHLyrics' then
               -- Инициализация генератора случайных чисел основана на времени
               math.randomseed(os.time())
               local randomNumber = math.random(1, 7)
               
               if randomNumber == 1 then 
                  playSound('VoiceLines/ChotixLines/1')
    
               elseif randomNumber == 2 then 
                  playSound('VoiceLines/ChotixLines/2')
                  debugPrint('Random is working!!!2')

               elseif randomNumber == 3 then 
                  playSound('VoiceLines/ChotixLines/3')
                  debugPrint('Random is working!!!3')

               elseif randomNumber == 4 then 
                  playSound('VoiceLines/ChotixLines/4')
                  debugPrint('Random is working!!!4')

               elseif randomNumber == 5 then 
                  playSound('VoiceLines/ChotixLines/5')
                  debugPrint('Random is working!!!5')

               elseif randomNumber == 6 then 
                  playSound('VoiceLines/ChotixLines/6')
                  debugPrint('Random is working!!!6')

               elseif randomNumber == 7 then 
                  playSound('VoiceLines/ChotixLines/7')
                  debugPrint('Random is working!!!7')
               end
           end
        end
    end
    if songName == 'you-cant-run-encore' or songName == 'you-cant-run' then
       function onTimerCompleted(tag)
           if tag == 'CHLyrics' then
               -- Инициализация генератора случайных чисел основана на времени
               math.randomseed(os.time())
               local randomNumber = math.random(1, 7)
               
               if randomNumber == 1 then 
                  playSound('VoiceLines/XenoYCRLines/1')
    
               elseif randomNumber == 2 then 
                  playSound('VoiceLines/XenoYCRLines/2')
                  debugPrint('Random is working!!!2')

               elseif randomNumber == 3 then 
                  playSound('VoiceLines/XenoYCRLines/3')
                  debugPrint('Random is working!!!3')

               elseif randomNumber == 4 then 
                  playSound('VoiceLines/XenoYCRLines/4')
                  debugPrint('Random is working!!!4')

               elseif randomNumber == 5 then 
                  playSound('VoiceLines/XenoYCRLines/5')
                  debugPrint('Random is working!!!5')

               elseif randomNumber == 6 then 
                  playSound('VoiceLines/XenoYCRLines/6')
                  debugPrint('Random is working!!!6')

               elseif randomNumber == 7 then 
                  playSound('VoiceLines/XenoYCRLines/7')
                  debugPrint('Random is working!!!7')
               end
           end
        end
    end
    if songName == 'old-ycr-slaps' then
      function onTimerCompleted(tag)
        if tag == 'CHLyrics' then
          math.randomseed(os.time())
          local randomNumber = math.random(1, 9)
          if randomNumber == 1 then 
             playSound('VoiceLines/XenoSlapsLines/1');
     
          elseif randomNumber == 2 then 
             playSound('VoiceLines/XenoSlapsLines/2');

          elseif randomNumber == 3 then 
             playSound('VoiceLines/XenoSlapsLines/3');

          elseif randomNumber == 4 then 
             playSound('VoiceLines/XenoSlapsLines/4');

          elseif randomNumber == 5 then 
             playSound('VoiceLines/XenoSlapsLines/5');

          elseif randomNumber == 6 then 
             playSound('VoiceLines/XenoSlapsLines/6');

          elseif randomNumber == 7 then 
             playSound('VoiceLines/XenoSlapsLines/7');

          elseif randomNumber == 8 then 
             playSound('VoiceLines/XenoSlapsLines/8');

          elseif randomNumber == 9 then 
             playSound('VoiceLines/XenoSlapsLines/9');
       
          elseif randomNumber == 10 then 
             playSound('VoiceLines/XenoSlapsLines/10');

          elseif randomNumber == 11 then 
             playSound('VoiceLines/XenoSlapsLines/11');
          end
        end
      end
    end
    if songName == 'oxxynless' then
        function onTimerCompleted(tag)
           if tag == 'CHLyrics' then
               math.randomseed(os.time())
               local randomNumber = math.random(1, 4)
               
               if randomNumber == 1 then 
                  playSound('VoiceLines/OxxyLines/1')
    
               elseif randomNumber == 2 then 
                  playSound('VoiceLines/OxxyLines/2')

               elseif randomNumber == 3 then 
                  playSound('VoiceLines/OxxyLines/3')

               elseif randomNumber == 4 then 
                  playSound('VoiceLines/OxxyLines/4')
               end
           end
       end
   end

  if songName == 'her-world-encore' then
    precacheSound('VoiceLines/SunterLines/1')
    precacheSound('VoiceLines/SunterLines/2')
    precacheSound('VoiceLines/SunterLines/3')
    precacheSound('VoiceLines/SunterLines/4')
    precacheSound('VoiceLines/SunterLines/5')
    precacheSound('VoiceLines/SunterLines/6')
  
    function onTimerCompleted(tag)
       if tag == 'CHLyrics' then
         math.randomseed(os.time())
         local randomNumber = math.random(1, 6)
         if randomNumber == 1 then
            playSound('VoiceLines/SunterLines/1')
    
         elseif randomNumber == 2 then 
            playSound('VoiceLines/SunterLines/2')

         elseif randomNumber == 3 then 
            playSound('VoiceLines/SunterLines/3')

         elseif randomNumber == 4 then 
            playSound('VoiceLines/SunterLines/4')

         elseif randomNumber == 5 then 
            playSound('VoiceLines/SunterLines/5')

         elseif randomNumber == 6 then 
            playSound('VoiceLines/SunterLines/6')
         end
       end
     end
   end
   if songName == 'B4CKSL4SH' then
     function onTimerCompleted(tag)
       if tag == 'CHLyrics' then
         math.randomseed(os.time())
         local randomNumber = math.random(1, 8)
         if randomNumber == 1 then 
            playSound('VoiceLines/Sl4shLines/1')
    
         elseif randomNumber == 2 then 
            playSound('VoiceLines/Sl4shLines/2')

         elseif randomNumber == 3 then 
            playSound('VoiceLines/Sl4shLines/3')

         elseif randomNumber == 4 then 
            playSound('VoiceLines/Sl4shLines/4')

         elseif randomNumber == 5 then 
            playSound('VoiceLines/Sl4shLines/5')

         elseif randomNumber == 6 then 
            playSound('VoiceLines/Sl4shLines/6')

         elseif randomNumber == 7 then 
            playSound('VoiceLines/Sl4shLines/7')

         elseif randomNumber == 8 then 
            playSound('VoiceLines/Sl4shLines/8')
         end
       end
     end
   end
  if songName == 'my-horizon-wechidna' then
    function onStepHit()
      if curStep < 921 then
        function onTimerCompleted(tag)
          if tag == 'CHLyrics' then
          math.randomseed(os.time())
          if math.random(1, 5) == 1 then
            playSound('VoiceLines/WechidnaLines/1')
    
          elseif math.random(1, 5) == 2 then 
            playSound('VoiceLines/WechidnaLines/2')

          elseif math.random(1, 5) == 3 then 
            playSound('VoiceLines/WechidnaLines/3')
            
          elseif math.random(1, 5) == 4 then 
            playSound('VoiceLines/WechidnaLines/4')

          elseif math.random(1, 5) == 5 then 
            playSound('VoiceLines/WechidnaLines/5')
          end
        end
      end
    end
    if curStep > 922 then
      function onTimerCompleted(tag)
        if tag == 'wechBeastLyrics' then
          math.randomseed(os.time())
            if math.random(1, 2) == 1 then 
               playSound('VoiceLines/WechidnaLines/6')

            elseif math.random(1, 2) == 2 then 
              playSound('VoiceLines/WechidnaLines/7')
            end
          end
        end
      end
    end
  end
  if songName == 'found-you' then
     function onTimerCompleted(tag)
       if tag == 'CHLyrics' then
         math.randomseed(os.time())
         local randomNumber = math.random(1, 9)
         if randomNumber == 1 then 
            playSound('VoiceLines/NormalLines/1');
    
         elseif randomNumber == 2 then 
            playSound('VoiceLines/NormalLines/2');

         elseif randomNumber == 3 then 
            playSound('VoiceLines/NormalLines/3');

         elseif randomNumber == 4 then 
            playSound('VoiceLines/NormalLines/4');

         elseif randomNumber == 5 then 
            playSound('VoiceLines/NormalLines/5');

         elseif randomNumber == 6 then 
            playSound('VoiceLines/NormalLines/6');

         elseif randomNumber == 7 then 
            playSound('VoiceLines/NormalLines/7');

         elseif randomNumber == 8 then 
            playSound('VoiceLines/NormalLines/8');

         elseif randomNumber == 9 then 
            playSound('VoiceLines/NormalLines/9');
       end
     end
   end
 end
 if songName == 'forestall-desire' then
   function onTimerCompleted(tag)
       if tag == 'CHLyrics' then
         math.randomseed(os.time())
         local randomNumber = math.random(1, 6)
         if randomNumber == 1 then
            playSound('VoiceLines/RequitalLines/1')
    
         elseif randomNumber == 2 then 
            playSound('VoiceLines/RequitalLines/2')

         elseif randomNumber == 3 then 
            playSound('VoiceLines/RequitalLines/3')

         elseif randomNumber == 4 then 
            playSound('VoiceLines/RequitalLines/4')

         elseif randomNumber == 5 then 
            playSound('VoiceLines/RequitalLines/5')

         elseif randomNumber == 6 then 
            playSound('VoiceLines/RequitalLines/6')
         end
      end
    end
  end
end