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
