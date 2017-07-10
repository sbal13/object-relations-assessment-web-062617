# Please copy/paste all three classes into this file to submit your solution!

#Customer class


class Customer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def restaurants_reviewed
  	self.reviews.map {|review| review.restaurant}
  end

  def reviews
  	Review.find_by_customer_name(self.full_name)
  end

  def add_review(restaurant_name, content)
  	new_review = Review.new(content)
  	new_review.customer = self
  	new_review.restaurant = Restaurant.find_by_name(restaurant_name)
  end


  def save
  	@@all << self
  end

  def self.new_by_name(first, last)
  	new_cust = Customer.new(first, last)
  	new_cust.save
  end

  def self.all
  	@@all
  end

  def self.find_by_name(full)
  	self.all.find{|cust| cust.full_name == full}
  end

  def self.find_all_by_first_name(first)
  	self.all.select{|cust| cust.first_name === first}
  end

  def self.all_names
  	self.all.map{|cust| cust.full_name}
  end

end

#Restaurant class

class Restaurant
  attr_accessor :name

  @@all = []
  def initialize(name)
    @name = name
    
  end

  def save
  	@@all  << self
  end

  def self.new_by_name(name)
  	new_rest = Restaurant.new(name)
  	new_rest.save
  end


  def self.all
  	@@all
  end

  def self.find_by_name(target_name)
  	self.all.find{|rest| rest.name == target_name}
  end

  def reviews
  	Review.find_by_restaurant_name(self.name)
  end

  def customers
  	self.reviews.map{|review| review.customer}
  end


end


#Review class

class Review

	attr_accessor :content, :restaurant, :customer

	@@all = []

	def initialize(content)
		@content = content
		@@all << self
	end

	def self.all
		@@all
	end

	def self.find_by_restaurant_name(target_restaurant_name)
		self.all.select{|review| review.restaurant.name  == target_restaurant_name}
	end

	def self.find_by_customer_name(target_customer_name)
		self.all.select{|review| review.customer.full_name  == target_customer_name}
	end

  
end



