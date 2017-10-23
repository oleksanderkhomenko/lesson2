require_relative 'pet'

puts "Дайте ім'я своєму депутату."

p = Pet.new(gets)
game = true

while game
  break unless p.alive?
  puts 'Дайте команду депутату.'
  command = gets.downcase.strip.tr(' ', '_').to_sym
  if p.methods.include?(command)
    p.send(command)
  elsif command == :exit
    break
  else
    puts 'Wrong command'
  end
end
