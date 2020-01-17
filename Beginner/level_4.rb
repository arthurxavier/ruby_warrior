# BEGINNER - LEVEL 4
class Player
  def play_turn(warrior)
    if warrior.feel.empty?
      if not_on_damage?(warrior) && warrior.health < 20     
        warrior.rest!
      else
        warrior.walk!
      end
    else
      warrior.attack!
    end
    @health = warrior.health
  end

  def not_on_damage?(warrior)
    !(@health && warrior.health < @health)
  end
end