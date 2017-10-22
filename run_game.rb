require_relative 'pet'

puts "Дайте ім'я своєму депутату."

p = Pet.new(gets)

while true
  break unless p.alive?
  puts 'Дайте команду депутату.'
  command = gets.downcase.strip.gsub(' ','_').to_sym
  if p.methods.include?(command)
    p.send(command)
  elsif command == :exit
    break
  else
    puts "Wrong command"
  end
end
