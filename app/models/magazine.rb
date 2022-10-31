require_relative "article"
class Magazine
  attr_accessor :name, :category

@@all_magazine =[]
  def initialize(name, category)
    @name = name
    @category = category
    @@all_magazine  << self

  end

def self.all
end

def mag_contributors
  Article.all.select{ |mag| mag.magazine.name == @name}
end

def contributors
  mag_contributors.map{ |cont| cont.author }.uniq
end

def self.find_by_name(name)
  @@all_magazine.find{ |mag| mag.name ==  name}
end

def article_titles
  Article.all.filter{|article| article.magazine.name == self.name}.map{|article| article.title}
end

def contributing_authors
  articles_in_magazine = Article.all.filter{|article| article.magazine == self}
  author_list = []
  articles_in_magazine.map{ |article| article.author.name }.tally.each{|key, value| value > 2 && author_list << key}
  author_list
end
end
