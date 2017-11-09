class Vampire

  coven = [] #Array where vampires will be added

  def initialize(name)
    @name = name
    @age = 0
    @in_coffin = true
    @@drank_blood_today = false
  end

  def name
    @name
  end

  def age
    @age
  end

  def drank_blood_today
    @drank_blood_today
  end

  def in_coffin
    @in_coffin
  end

  def self.create(name)
    new_vampire = Vampire.new(name)
    coven << new_vampire
    return new_vampire
  end

  def drink_blood
    @drank_blood_today = true
  end

  def self.sunrise
    Vampire.coven.delete_if do |vampire|
      !vampire.drank_blood_today || !vampire.in_coffin
    end
  end

  def sunset
    @drank_blood_today = false
    @in_coffin = false
  end

  def self.sunset
    @@coven.each {|vampire| vampire.sunset}
  end

end
