# BEGINNER - LEVEL 6
class Player
  FULL_LIFE = 20

  def play_turn(warrior)
    @warrior = warrior
    @direction ||= :backward

    decisions_warrior
    
    @health = @warrior.health
  end

  def decisions_warrior
    if @warrior.feel(@direction).empty?
      unless on_damage?
        ready_to_finish? ? @warrior.walk!(@direction) : prepare_to_battle 
      else
        direction_to_battle
        @warrior.walk!(@direction)
      end
    else
      decision_actions
    end
  end

  def decision_actions
    if @warrior.feel(@direction).captive?
      @warrior.rescue!(@direction)
    elsif @warrior.feel(@direction).enemy?
      ready_to_battle? ? @warrior.attack!(@direction) : change_direction
    elsif @warrior.feel(@direction).wall?
      change_direction
    end
  end

  def on_damage?
    @health && @warrior.health < @health
  end

  def ready_to_finish?
    full_life? || @warrior.feel(@direction).stairs?
  end
  
  def full_life?
    @warrior.health == FULL_LIFE
  end

  def change_direction
    @direction = @direction == :forward ? :backward : :forward
  end

  def direction_to_battle
    @direction = ready_to_battle? ? :forward : :backward
  end

  def ready_to_battle?
    @warrior.health > FULL_LIFE/2
  end

  def prepare_to_battle
    @warrior.rest!
    @direction = :forward
  end
end