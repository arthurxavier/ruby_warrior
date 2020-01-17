# BEGINNER - LEVEL 5
class Player
  def play_turn(warrior)
    if warrior.feel.empty?
      if not_on_damage?(warrior) && full_life(warrior)     
        warrior.rest!
      else
        warrior.walk!
      end
    else
      if warrior.feel.captive?
        warrior.rescue!
      else
        warrior.attack!
      end
    end
    @health = warrior.health
  end

  def not_on_damage?(warrior)
    !(@health && warrior.health < @health)
  end
  
  def full_life(warrior)
    warrior.health == 20
  end
end