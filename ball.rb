require 'yaml'

class Ball
  ANSWERS = YAML.load_file(File.join(__dir__, 'answers.yml'))
  COLORS = [31, 32, 33, 34]

  def shake
    answers = {}
    count = 0
    COLORS.each do |x|
      answers[x] = ANSWERS[count..count + 4] if ANSWERS.count > count
      count += 5
    end
    color = answers.keys.sample
    answer = answers[color].sample
    colorize(color, answer)
    answer
  end

  private

  def colorize(color, string)
    puts "\e[#{color}m#{string}\e[0m"
  end
end
