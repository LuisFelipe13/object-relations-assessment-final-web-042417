# Please copy/paste all three classes into this file to submit your solution!
require "pry"
class Viewer
  attr_accessor :first_name, :last_name
  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(viewer_name)
    @@all.find {|name| name.full_name == viewer_name}
  end

  def create_rating(score, movie)
    Rating.new(movie, score, self.full_name)
  end
end

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
    @@all.find {|movie| movie.title == title}
  end

  def ratings
    scores = Rating.all.collect {|rating| rating.score if rating.movie == self.title}
    scores.compact
  end

  def viewers
    Rating.all.collect {|rating| rating.viewer if rating.movie == self.title}
  end

  def average_rating
    score_array = Rating.collect {|rating| rating.score}
    the_score = 0
    score_array.each do |score|
      the_score += score
    end
    viewers = Rating.all.size
    score = score/viewers
    score
  end
end

class Rating
  attr_accessor :movie, :score, :viewer
  @@all = []

  def initialize(movie, score, viewer)
    @movie = movie
    @score = score
    @viewer = viewer
    @@all << self
  end

  def self.all
    @@all
  end

  def viewer
    self.viewer
  end

  def movie
    self.movie
  end
end
