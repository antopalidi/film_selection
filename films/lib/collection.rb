require 'nokogiri'
require 'open-uri'
require 'escape_utils'

class Collection
  URL = "https://ru.wikipedia.org/wiki/#{EscapeUtils.escape_url('250_лучших_фильмов_по_версии_IMDb')}".freeze

  def self.from_wiki_imdb250
    doc = Nokogiri::HTML(URI.open(URL))

    doc.css('tr')[1..250].map do |film_node|
      title = film_node.css('td')[1].text.strip
      director = film_node.css('td')[3].text.strip
      year = film_node.css('td')[2].text.strip
      genre = film_node.css('td')[4].text.strip

      Film.new(title, director, year, genre)
    end
  end
end
