
#Navece, napolju
#ili
#Klanjati navece napolju, poslije iftara

with_fx :reverb do
  live_loop :drums do
    
    3.times do
      sample :drum_bass_soft
      sleep 0.25
    end
    sleep 0.25
    #sample :drum_bass_soft
    sleep 0.5
    
    
    
    sample :drum_bass_soft
    sleep 1
    sample :drum_bass_soft
    sleep 0.5
  end
  
  live_loop :drums2 do
    sync :drums
    
    sleep 1.5
    sample :drum_snare_soft
    sleep 0.5
    sleep 0.5
    sample :drum_snare_soft
    sleep 0.5
  end
end

live_loop :drums3 do
  sample :drum_cymbal_closed
  sleep 0.5
end

live_loop :bassChords do
  use_synth :fm
  
  sync :drums
  
  with_fx :flanger do
    
    4.times do
      4.times do
        play [chord(:c, :minor7), chord(:ds, :major), chord(:f, :minor), chord(:f, :minor7)].ring.tick, sustain: 1.5
        sleep 1.5
      end
    end
    
    play chord(:c, :minor7), sustain: 12
    sleep 12
  end
  
  stop
  
end


live_loop :chords do
  sync :bassChords
  
  use_synth :pretty_bell
  
  with_synth_defaults amp: 0.25 do
    with_fx :wobble do
      4.times do
        6.times do
          play :c
          sleep 0.25
        end
        6.times do
          play :ds
          sleep 0.25
        end
        6.times do
          play :f
          sleep 0.25
        end
        6.times do
          play :f
          sleep 0.25
        end
      end
    end
    
    use_synth :fm
    with_fx :flanger do
      2.times do
        24.times do
          play scale(:c5, :minor_pentatonic).choose, amp: 0.5
          sleep 0.25
        end
      end
    end
  end
  stop
  
end