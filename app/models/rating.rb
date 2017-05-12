class Rating
  attr_accessor :movie, :score, :viewer
  @@all = []

  def initialize(movie, score, viewer)
    @movie = movie
    @score = score
    @@all << self
  end

  def self.all
    @@all
  end

  def viewer
    self.viewer
  end

  def method_name
    self.movie
  end
end
