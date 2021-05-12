# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.delete_all
Book.delete_all

100.times do
    author = Author.create! name: Faker::Book.author, biography: Faker::Lorem.paragraph(sentence_count: 3), genres: Faker::Book.genre
    puts "Created new author: #{author.name}"

    10.times do
       book = Book.create!(
	  title: Faker::Book.title,
          description: Faker::Lorem.paragraph(sentence_count: 3),
          ratings: rand(1..5),
          author_id: author.id
       )
       puts "Created Book #{book.title} for author #{book.author_id}"
    end

end
