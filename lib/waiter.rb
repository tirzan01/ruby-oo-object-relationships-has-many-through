class Waiter

  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select{ |meal| meal.waiter == self }
  end

  def best_tipper
    best_tipper = self.meals[0]
    self.meals.each do |customer|
      best_tipper = customer if customer.tip > best_tipper.tip
    end
    best_tipper.customer
  end

  def self.all
    @@all
  end

end