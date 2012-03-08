# Basic OOP

class Dessert
  attr_accessor :name
  attr_accessor :calories
  def initialize(name, calories)
    self.name = name
    self.calories = calories
  end
  def healthy?
    @calories < 200
  end
  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(name, calories, flavor)
    super name, calories
    self.flavor = flavor
  end
  def delicious?
    if self.flavor == "black licorice"
      false
    else
      super
    end
  end
end

