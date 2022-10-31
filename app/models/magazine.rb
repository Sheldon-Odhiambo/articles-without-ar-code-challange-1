require_relative "article"
class Magazine
  attr_accessor :name, :category

@@all magazine =[]
  def initialize(name, category)
    @name = name
    @category = category
    @@all  << self

  end

def self.all
end

end
