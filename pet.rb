class Pet
  HELP = File.open('help.txt', 'r+', &:read)
  def initialize(name = 'Lyashko')
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

    puts "#{@name.gsub("\n", "")}: Я ваш новий чи старий депутат. Україна це Еуропа.",""
  end

  # дати хабара
  def give_bribe
    @corruption += 10
    @greed += 10
    @mood += 20
    puts "Вашому депутату дали хабара."
    puts "#{@name.gsub("\n", "")}: Ці руки нічого не крали!",""
    time_travel
  end

  # звинуватити у злочині
  def blame_a_crime
    @greed += -15
    @corruption += -15
    puts "Вашого депутата звинуватили у злочині."
    puts "#{@name.gsub("\n", "")}: Слава Україні!",""
    time_travel
  end

  # посидіти в ресторані
  def restaurant
    @hunger = 0
    puts "Ваш депутат поїв в ресторані."
    puts "#{@name.gsub("\n", "")}: Дякую моїм потнякам податків.",""
    time_travel
  end

  # полікувати
  def hospital
    @health = 100
    puts "Депутат поправив своє здоров'я"
    puts "#{@name.gsub("\n", "")}: Не будемо говорити про погане, а краще зробимо.",""
    time_travel
  end

  # поспати
  def sleep_a_little
    @sleepiness = 0
    @fatigue = 0
    @mood = 100
    @hunger += 40
    puts "#{@name.gsub("\n", "")}: Любимий город може спать спокойно.",""
    time_travel
  end

  # вивести стати
  def stats
    deputat_stats = {}
    self.instance_variables.each do |attr|
      deputat_stats[attr] = self.instance_variable_get(attr)
    end
    p deputat_stats
  end

  def alive?
    if @health < 1
      puts "#{@name.gsub("\n", "")} не вижив в такому жорстокому світі.",""
      false
    else
      true
    end
  end

  def check_hunger
    if @hunger > 80
      puts "#{@name.gsub("\n", "")}: Голодний такий."
      @health += -15
    end
  end

  def check_corruption
    if @corruption > 99
      @health = 0
      puts "Багато крав. От вашого депутата і посадили.","#{@name.gsub("\n", "")}: Це зрада!"
    end
  end

  def check_fatigue
    if @fatigue > 99
      sleep_a_little
      puts "#{@name.gsub("\n", "")}: Я так втомився.",""
    end
  end

  def check_sleepiness
    if @sleepiness > 99
      @health += -15
      puts "#{@name.gsub("\n", "")}: Від роботи й коні дохнуть.",""
      sleep_a_little
    end
  end

  def check_mood
    if @mood < 50
      puts "#{@name.gsub("\n", "")}: Так скучно.",""
      give_bribe
    end
  end

  def help
    puts "#{HELP}",""
  end

  private

  # імітація часу
  def time_travel
    @hunger += 10
    @mood += -15
    @fatigue += -15
    @sleepiness += 10
    check_stats
  end

  def check_stats
    self.instance_variables.each do |attr|
      if attr != :@name
        value = [[self.instance_variable_get(attr), 100].min, 0].max
        self.instance_variable_set(attr, value)
      end
    end
    alive?
    check_corruption
    check_hunger
    check_fatigue
    check_sleepiness
    check_mood
  end
end
