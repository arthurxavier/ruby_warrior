# BEGINNER - LEVEL 1
class Player
  def play_turn(warrior)
    if warrior.feel.empty?
      warrior.walk!
    end
  end
end