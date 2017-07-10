require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Customer.new_by_name("Steven", "Balasta")
# Customer.new_by_name("Julie", "Hwang")
# Customer.new_by_name("Tim", "Campbell")
# Customer.new_by_name("Meryl", "Dankin")
# Customer.new_by_name("Steven", "Miller")

# me  = Customer.find_by_name("Steven Balasta")
# julie = Customer.find_by_name("Julie Hwang")

# Restaurant.new_by_name("The Kraken")
# Restaurant.new_by_name("Wild BBQ")
# Restaurant.new_by_name("U-Yee")
# Restaurant.new_by_name("Lupa")



Pry.start
