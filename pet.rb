class Pet
  HELP = File.open('help.txt', 'r+', &:read)
  def initialize(name = 'Lyashko')
    @name = name
    @health = 100
    @hunger = 0
    @mood = 100
    @fatigue = 0
    @sleepiness = 0
    @greed = 50
    @corruption = 30

    puts "#{@name.tr("\n", '')}: Я ваш депутат. Україна це Еуропа.", ''
  end

  # give bribe
  def give_bribe
    @corruption += 10
    @greed += 10
    @mood += 20
    puts 'Вашому депутату дали хабара.'
    puts "#{@name.tr("\n", '')}: Ці руки нічого не крали!", ''
    time_travel
  end

  # blame a crime
  def blame_a_crime
    @greed += -15
    @corruption += -15
    puts 'Вашого депутата звинуватили у злочині.'
    puts "#{@name.tr("\n", '')}: Слава Україні!", ''
    time_travel
  end

  # eat
  def restaurant
    @hunger = 0
    puts 'Ваш депутат поїв в ресторані.'
    puts "#{@name.tr("\n", '')}: Дякую моїм потнякам податків.", ''
    time_travel
  end

  # cure
  def hospital
    @health = 100
    puts 'Депутат поправив своє здоров\'я'
    puts "#{@name.tr("\n", '')}: Не будемо говорити про погане, а краще зробимо.", ''
    time_travel
  end

  # sleep
  def sleep_a_little
    @sleepiness = 0
    @fatigue = 0
    @mood = 100
    @hunger += 40
    puts "#{@name.tr("\n", '')}: Любимий город може спать спокойно.", ''
    time_travel
  end

  # show stats
  def stats
    deputat_stats = {}
    instance_variables.each do |attr|
      deputat_stats[attr] = instance_variable_get(attr)
    end
    p deputat_stats
  end

  def alive?
    if @health < 1
      puts "#{@name.tr("\n", '')} не вижив в такому жорстокому світі.", ''
      false
    else
      true
    end
  end

  def check_hunger
    return unless @hunger > 80
    puts "#{@name.tr("\n", '')}: Голодний такий."
    @health += -15
  end

  def check_corruption
    return unless @corruption > 99
    @health = 0
    puts 'Вашого депутата посадили.', "#{@name.tr("\n", '')}: Це зрада!"
  end

  def check_fatigue
    return unless @fatigue > 99
    sleep_a_little
    puts "#{@name.tr("\n", '')}: Я так втомився.", ''
  end

  def check_sleepiness
    return unless @sleepiness > 99
    @health += -15
    puts "#{@name.tr("\n", '')}: Від роботи й коні дохнуть.", ''
    sleep_a_little
  end

  def check_mood
    return unless @mood < 50
    puts "#{@name.tr("\n", '')}: Так скучно.", ''
    give_bribe
  end

  def help
    puts "#{HELP}", ''
  end

  private

  # time imitation
  def time_travel
    @hunger += 10
    @mood += -15
    @fatigue += -15
    @sleepiness += 10
    check_stats
  end

  def check_stats
    instance_variables.each do |attr|
      if attr != :@name
        value = [[instance_variable_get(attr), 100].min, 0].max
        instance_variable_set(attr, value)
      end
    end
    check_needs
  end

  def check_needs
    check_corruption
    check_hunger
    check_fatigue
    check_sleepiness
    check_mood
  end
end
