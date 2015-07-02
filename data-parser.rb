require 'csv'
require 'pp'

class Delivery
  attr_accessor :destination, :money

end


###########
deliveries = [] # contains week_one_object 's data as an array of hashes
fry = []
amy = []
bender = []
leela = []

CSV.foreach("./planet_express_logs.csv", headers: true) do |line| # for each line do something
  deliveries << line.to_hash # Get info about each flight, and put into array of hashes
  week_one_object = Delivery.new
  week_one_object.money = line.to_hash["Money we made"].to_i
  week_one_object.destination = line.to_hash["Destination"]
  # puts week_one.money

  if week_one_object.destination.include? "Earth"
    fry << week_one_object.money
  elsif week_one_object.destination.include? "Mars"
    amy << week_one_object.money
  elsif week_one_object.destination.include? "Uranus"
    bender << week_one_object.money
  else
    leela << week_one_object.money
  end

end

fry_total = fry.reduce(:+)
amy_total = amy.reduce(:+)
bender_total = bender.reduce(:+)
leela_total = leela.reduce(:+)

fry_bonus = fry_total * 0.1
amy_bonus = amy_total * 0.1
bender_bonus = bender_total * 0.1
leela_bonus = leela_total * 0.1

company_income = [fry_total, amy_total, bender_total, leela_total].reduce(:+)
puts "Weekly income for the company: $#{company_income}\n\n"

puts "Fry gets $#{fry_bonus.to_i} as bonus for #{fry.count} trips."
puts "Amy gets $#{amy_bonus.to_i} as bonus for #{amy.count} trips."
puts "Bender gets $#{bender_bonus.to_i} as bonus for #{bender.count} trips."
puts "Leela gets $#{leela_bonus.to_i} as bonus for #{leela.count} trips."

# Destination,What got shipped,Number of crates,Money we made

# Fry - pilots to Earth
# Amy - pilots to Mars
# Bender - pilots to Uranus
# Leela - pilots everywhere else

# Destinations flown to:
# Earth
# Moon
# Earth
# Mars
# Uranus
# Jupiter
# Pluto
# Uranus
# Saturn
# Mercury
