# Use object-oriented Ruby to model a public library
#   (w/ three classes: Library, Shelf, & Book). *
# The library should be aware of a number of distinct shelves.
# Each shelf should know what books it contains.
# Create methods to add and remove a book from a self.
# The library should have a method to report all books it contains.
#   Note: this should *not* be a Rails app - just a single file
# with three classes (plus commands at the bottom showing it
# works) is all that is needed.

class Library
  def initialize(shelf_count = 0)
    @shelves = []
    [shelf_count, 0].max.times { @shelves << Shelf.new }
    puts 'This library is useless' if @shelves.empty?
  end

  def shelve_book(shelf, title)
    if @shelves[shelf].nil?
      puts "Unable to shelve '#{title}'"
    else
      @shelves[shelf].new_book(title)
    end
  end

  def remove_book(shelf, title)
    fail = @shelves[shelf].nil?
    fail ||= !@shelves[shelf].book_removed?(title)
    puts "Unable to remove '#{title}'" if fail
  end

  def inventory
    puts "\n-- Inventory of books"
    puts @shelves.flat_map(&:books_on_shelf).sort
  end
end

class Shelf
  def initialize
    @books = []
  end

  def books_on_shelf
    @books.map(&:title)
  end

  def new_book(title)
    @books << Book.new(title)
  end

  def book_removed?(title)
    if books_on_shelf.include?(title)
      @books.delete_at(books_on_shelf.index(title))
      true
    else
      false
    end
  end
end

class Book
  attr_reader :title
  def initialize(title)
    @title = title
  end
end

Library.new(-1) # fail
useless_library = Library.new # fail
useless_library.shelve_book(0, 'A Bridge Too Far') # fail
puts '-----'
my_library = Library.new(3)
my_library.shelve_book(0, 'Learn to Program')
my_library.shelve_book(0, 'Beginning Ruby')
my_library.shelve_book(1, 'JavaScript & Jquery')
my_library.shelve_book(1, 'HTML & CSS')
my_library.shelve_book(1, 'HTML & CSS')
my_library.shelve_book(1, 'Learn to Program')
my_library.shelve_book(3, 'Faust') # fail
my_library.inventory
puts '-----'
my_library.remove_book(0, 'HTML & CSS') # fail
my_library.remove_book(1, 'HTML & CSS')
my_library.remove_book(1, 'JavaScript & Jquery')
my_library.remove_book(1, 'HTML & CSS')
my_library.remove_book(1, 'Learn to Program')
my_library.remove_book(3, 'Faust') # fail
my_library.inventory
