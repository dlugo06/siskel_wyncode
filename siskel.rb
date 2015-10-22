require 'httparty'

class Siskel
  attr_reader :rating, :year, :plot, :title

  def initialize(title, options = {})
    @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}&y=#{options[:year]}&plot=#{options[:plot]}")
    @title = @movie['Title']
    @rating = @movie['Rated']
    @year = @movie['Year']
    @plot = @movie['Plot']
  end

  #refactor to put in the reader and initialize method
  def title
    if @title == nil
      "Movie not found!"
    else
      @title
    end
  end

  def consensus
    if @movie['Metascore'].to_i.between?(51,100)
      @consensus = "Thumbs Up"
    elsif @movie['Metascore'].to_i.between?(0,50)
      @consensus = "Thumbs Down"
    else
      "Metascore has to be between 0 - 100."
    end
  end


  # def movie_existence
  #    puts "Movie not found!" if @title == nil
  # end
end
