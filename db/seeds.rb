require "csv"

Author.delete_all
Genre.delete_all
Year.delete_all
Book.delete_all

filename = Rails.root.join("db/bestsellers.csv")
puts "Loading Books from the csv file: #{filename}"

csv_data = File.read(filename)
books = CSV.parse(csv_data, headers:true, encoding: "utf-8")

books.each do |b|
  author = Author.find_or_create_by(name: b['Author'])
  genre = Genre.find_or_create_by(name: b['Genre'])
  # if author && author.valid? && genre && genre.valid?
  #   #create a book
  #   book = author.books.create(
  #     title:    b["Name"],
  #     rating:   b["User Rating"],
  #     reviews:  b["Reviews"],
  #     price:    b["Price"]
  #   )
  #   puts "Invalid book #{b['Name']}" unless book&.valid?
  # else
  #   puts "invalid author #{b['Author']} for book #{b['Name']}"
  # end

  book = Book.find_or_create_by(
      title:    b["Name"],
      rating:   b["User Rating"],
      reviews:  b["Reviews"],
      price:    b["Price"],
    )

  puts b['Name']
  puts b["User Rating"]
  puts b["Reviews"]
  puts b["Price"]

end
puts "Created #{Author.count} Authors"
puts "Created #{Genre.count} Genres"
puts "Created #{Book.count} Books"

