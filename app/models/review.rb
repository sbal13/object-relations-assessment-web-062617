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

