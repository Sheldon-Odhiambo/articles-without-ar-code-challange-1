# Please copy/paste all three classes into this file to submit your solution!
require 'pry'
class Article    
    attr_reader :author, :magazine, :title      
    @@all = []
    def initialize(author, magazine, title)     
            @author = author      
            @magazine = magazine        
            @title = title     
            @@all << self   
        end
    def self.all    
            @@all  
    end
end


require_relative "article"
class Author
  attr_accessor :name


  def initialize(name)
    @name = name
  
  end

  def articles   
    Article.all.filter do |article|   
        article.author == self   
      end 
    end

    def magazines    
    mag_contribution = articles.collect do |article|  
            article.magazine
        end  
        mag_contribution.uniq
          end

def add_article(magazine, title)
    Article.new(self, magazine, title)
  end

  def topic_areas
    magazines.map{|magazine| magazine.category}.uniq
  end

end

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
