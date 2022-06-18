class Film
  attr_reader :title, :director, :year, :genre

  def initialize(title, director, year, genre)
    @title = title
    @director = director
    @year = year.to_i
    @genre = genre
  end

  def to_s
    "#{@title}. Режисер: #{director} - #{@year}, #{@genre}"
  end
end
