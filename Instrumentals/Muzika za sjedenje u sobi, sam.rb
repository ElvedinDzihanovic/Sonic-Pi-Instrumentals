use_bpm 90

#Muzika za sjedenje u sobi, sam
#ILI
#Imena svega sto je nedostupno

live_loop :drums1 do
  with_fx :echo do #moze i bez
    sample :drum_cymbal_closed
    sleep 0.5
  end
end

live_loop :drums2 do
  3.times do
    sleep 1
    sample :elec_snare
    sleep 1
  end
  
  2.times do
    2.times do
      sample :elec_snare
      sleep 0.25
    end
    sleep 0.25
  end
  sample :elec_snare
  sleep 0.5
end

live_loop :bd do
  2.times do
    sample :bd_klub
    sleep 0.75
  end
  sleep 0.5
end

sleep 16

x = 0.70

live_loop :fm do
  use_synth :fm
  
  if x > 0
    n = [6, 8].ring.tick(:foo)
    
    use_random_seed [55, 65].ring.tick(:foo2)
    # with_fx :flanger do
    n.times do
      play scale(:f, :minor).choose, amp: x, sustain: 1.025
      sleep 0.25
    end
    
  else
    stop
  end
  x -= 0.025
end