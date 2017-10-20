class Pet
  def initialize(name)
    @name = name
    # здоров'я
    @health = 100
    # голод
    @hunger = 0
    # настрій
    @mood = 100
    # втома
    @fatigue = 0
    # сонливість
    @sleepiness = 0
    # жадність
    @greed = 50
    # корумпованість
    @corruption = 30

    puts "#{@name}: Я ваш новий чи старий депутат. Україна це Еуропа."
  end

  # дати хабара
  def give_bribe
    change_corruption 10
    change_greed 10
    change_mood 20
    puts "#{@name}: Ці руки нічого не крали!"
    time_travel
  end

  # звинватити у злочині
  def blame_a_crime
    change_greed(-10)
    change_corruption(-15)
    puts '#{@name}: Слава Україні!'
    time_travel
  end

  private

  def time_travel
    change_hunger 15
    change_mood(-10)
    change_fatigue 15
    change_sleepiness 20
    check_stats
  end

  def check_stats
    if @corruption > 99
      @health = 0
      puts "Вашого депутата посадили в тюрьму!"
    end
    if @health < 1
      puts "Ваш депутат не вижив в такому жорстокому світі"
    end
    if @mood < 1
      @gree += 20
      @corruption += 15
    end
  end

  def change_health(val)
    @health += val
    @health = [[@health, 100].min, 0].max
  end
  def change_hunger(val)
    @hunger += val
    @hunger = [[@hunger, 100].min, 0].max
  end
  def change_mood(val)
    @mood += val
    @mood = [[@mood, 100].min, 0].max
  end
  def change_fatigue(val)
    @fatigue += val
    @fatigue = [[@fatigue, 100].min, 0].max
  end
  def change_sleepiness(val)
    @sleepiness += val
    @sleepiness = [[@sleepiness, 100].min, 0].max
  end
  def change_greed(val)
    @greed += val
    @greed = [[@greed, 100].min, 0].max
  end
  def change_corruption(val)
    @corruption += val
    @corruption = [[@corruption, 100].min, 0].max
  end

end