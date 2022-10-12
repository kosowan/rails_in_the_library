require "csv"

# Author.delete_all
# Genre.delete_all
# Year.delete_all
Book.delete_all
Author.delete_all
Genre.delete_all
Year.delete_all
BookYear.delete_all

filename = Rails.root.join("db/bestsellers.csv")
puts "Loading Books from the csv file: #{filename}"

csv_data = File.read(filename)
books = CSV.parse(csv_data, headers:true, encoding: "utf-8")

books.each do |b|
  author = Author.find_or_create_by(name: b['Author'])
  genre = Genre.find_or_create_by(name: b['Genre'])
  if author && author.valid? && genre && genre.valid?
    #create a book
    book = Book.find_or_create_by(
      title:    b["Name"],
      rating:   b["User Rating"],
      reviews:  b["Reviews"],
      price:    b["Price"],
      author_id:  author.id,
      genre_id:   genre.id
    )
    puts "Invalid book #{b['Name']}" unless book&.valid?

    #years
    years = b["Year"].split(",").map(&:strip)

    years.each do |year|
      year = Year.find_or_create_by(year: year)

      BookYear.create(book: book, year: year)
    end
  else
    puts "invalid author #{b['Author']} for book #{b['Name']}"
  end

end
puts "Created #{Author.count} Authors"
puts "Created #{Genre.count} Genres"
puts "Created #{Book.count} Books"
puts "Created #{Year.count} Years"
puts "Created #{BookYear.count} Book Years"

