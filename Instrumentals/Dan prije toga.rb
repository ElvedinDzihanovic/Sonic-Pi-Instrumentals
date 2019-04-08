use_bpm 90

#Dan prije toga

live_loop :drums do
  
  sample :bd_ada, rate: 1.15
  sleep 0.25 # ili 1, ili 0.5 ili...
end

live_loop :drumSnare do
  sync :drums
  
  with_fx :echo do
    4.times do
      sample :drum_cymbal_closed, rate: 1.25
      sleep 0.25
    end
  end
end


live_loop :snare do
  sync :drums
  
  sleep 1
  sample :elec_hollow_kick
  sample :elec_snare, rate: 1.25
  sleep 1
end
################

i = 0
live_loop :bass do
  #use_synth :pretty_bell
  use_synth :fm
  
  niz = [:a2, :fs2, :e2, :e2].ring
  
  x = niz.tick
  16.times do
    play x, amp: 1.65, release: 0.55, pan: [-1, 1].ring.tick
    sleep 0.25
  end
end

live_loop :chords do
  sync :drums
  
  use_synth :blade
  
  with_fx :flanger do
    play [chord(:a3, :major), chord(:fs3, :minor), chord(:e3, :major), chord(:e3, :major) ].ring.tick, sustain: 4
    sleep 4
  end
end

a = [:a4, :e5, :a5, :e5, :cs6, :a5, :e5, :a5].ring
fs = [:fs4, :cs5, :fs5, :cs5, :a6, :fs5, :cs5, :fs5].ring
e = [:e4, :b4, :e5, :b4, :gs5, :e5, :b4, :e5].ring

live_loop :razlaganje do
  sync :chords
  
  stop
  
  use_synth :piano
  
  with_fx :flanger do
    2.times do
      play_pattern_timed a, 0.25
    end
    2.times do
      play_pattern_timed fs, 0.25
    end
    4.times do
      play_pattern_timed e, 0.25
    end
  end
end