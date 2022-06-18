require_relative 'lib/film'
require_relative 'lib/collection'

collection = Collection.from_wiki_imdb250()

directors = collection.map(&:director).uniq.sample(10)

puts 'Программа «Фильм на вечер»'
puts
puts 'Выберите режиссера. Введите порядковый номер:'
puts
directors.each.with_index(1) { |director, i| puts "#{i}. #{director}" }
chosen_director = directors[gets.to_i - 1]
puts
puts "Вы выбрали: #{chosen_director}. Смотрю, что есть из фильмов этого режиссера."
puts

examples_of_film = collection.select { |film| film.director == chosen_director }
random_film = examples_of_film.sample

puts "Сегодня рекомендую посмотреть: #{random_film}"
