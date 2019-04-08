use_bpm 90

#Hodati kuci sam poslije sjedenja s prijateljima

live_loop :one do
  use_synth :pulse
  
  use_random_seed [15, 13, 12, 13].ring.tick
  
  
  #  with_fx :slicer do
  with_fx :flanger do
    4.times do
      4.times do
        play chord(:e, :major).choose, release: 0.75, amp: 0.25
        sleep 0.25
      end
    end
    4.times do
      4.times do
        play chord(:gs, :minor).choose, release: 0.75, amp: 0.25
        sleep 0.25
      end
    end
  end
end
#end

live_loop :solo do
  sync :one
  
  use_synth :pulse
  
  
  use_random_seed 44
  #umjesto wobble-a moze i flanger, a moze i bez efekata
  with_fx :wobble do
    50.times do
      play scale(:cs5, :minor_pentatonic).choose, amp: 0.5, pan: [-1, 0, 1].choose
      sleep [0.25, 0.5,  0.25].choose
    end
  end
end

live_loop :two do
  sync :one
  
  use_synth :blade
  
  with_fx :slicer do
    8.times do
      play chord(:e, :major), amp: 1
      sleep 0.5
    end
    8.times do
      play chord(:gs, :minor), amp: 1
      sleep 0.5
    end
  end
end

live_loop :three do
  use_synth :fm
  
  sync :one
  with_fx :flanger do
    2.times do
      play [:e3, :gs3].ring.tick, sustain: 4, amp: 0.2
      sleep 4
    end
  end
end

live_loop :drums1 do
  sync :one
  
  with_fx :wobble do
    2.times do
      8.times do
        sample :drum_bass_hard
        sleep [0.25, 0.5, 1].ring.tick
      end
      sleep 2
    end
  end
end
