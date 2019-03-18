Quote.all.destroy_all

10.times do
  Quote.create(character: Faker::TvShows::Seinfeld.character, quote: Faker::TvShows::Seinfeld.quote, episode: rand(1..180) )
end

puts "#{Quote.all.count} quotes generated."
