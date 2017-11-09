class Zombie

  # CLASS variables
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def initialize(zombie_speed, zombie_strength)
    zombie_speed = rand(10)
    if zombie_speed > @@max_speed
      zombie_speed = @default_speed
    end

    zombie_strength = rand(10)
    if zombie_strength > @@max_strength
      zombie_strength = @default_strength
    end
  end


  #INSTANCE METHODS
  def initialize(speed, strength)
    if speed > @@max_speed
     @speed = @@default_speed
   else
     @speed = speed
   end

   if strength > @@max_strength
     @strength = @@default_strength
   else
     @strength = strength
   end

  end

  def encounter
    if survive_attack? == false
      return "You died!"
    else
      if outrun_zombie? == false
        speed = rand(@@max_speed)
        strength = rand(@@max_strength)
        @@horde << Zombie.new(speed, strength)
        return "You're too slow and now you're a zombie"
      else
        return "You outran the zombies! You're still alive"
      end
    end
  end

  def outrun_zombie?

  end

  def survive_attack?
    your_strength = rand(@@max_strength)
    if your_strength > @strength
      return true
    else
      return false
    end
  end

  end

  #CLASS METHOD
  def self.all
    return @@horde
  end

  def self.new_day
    Zombie.some_die_off
    Zombie.spawn
    Zombie.increase_plague_level
  end

  def self.some_die_off
    @@horde.shift(rand(0..10))
  end

  def self.spawn
    number_of_zombies = rand(@plague_level)
    (1..number_of_zombies).each do
      speed = rand(@@max_speed)
      strength = rand(@@max_speed)
      @@horde << Zombie.new(zombie_speed, zombie_strength)
    end
  end

  def self.increase_plague_level
    @@plague_level += rand(0..2)
  end

end

puts "-----------"
