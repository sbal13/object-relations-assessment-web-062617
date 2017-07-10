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
