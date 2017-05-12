class Movie
  attr_accessor :title
  @@all = []

  def initialize(title)
    @title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    @@all.find {|movie| movie.name == name}
  end

  def ratings
    Rating.all.collect {|rating| rating.movie == self}
  end

  def viewers
    Rating.collect {|rating| rating.viewer}
  end
end
