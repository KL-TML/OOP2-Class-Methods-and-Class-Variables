class Books
  #Class variables
  @@on_shelf = []
  @@on_loan = []

  def initialize(book_title, author, isbn)
    @book_title = book_title
    @author = author
    @isbn = isbn
    @due_date = nil
  end

 # READER Methods - CLASS
  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end

  # def due_date ###DON"T REQUIRE CLASS DUE DATE READER because due date is instant specific
  #   @@due_date
  # end

  # READER Methods - INSTANCES

  def book_title
    @book_title
  end

  def author
    @author
  end

  def isbn
    @isbn
  end

  def due_date
    @due_date
  end

  # WRITER Methods - CLASSES

  def self.create(book_title, author, isbn) #creating a new book/a new class
    book = Books.new(book_title, author, isbn)
    @@on_shelf << book
    book
  end

  def self.browse
    puts Books.available.sample.inspect ## Allows users to see all of the information regarding that one book
  end

  def self.current_due_date
    Time.now + 7200
  end

  def self.overdue
    result = []
    Books.borrowed.each do |book|
      if book.due_date < Time.now
        result << book
      end
    end
  end

  # WRITER METHOD - Instances

  def due_date=(due_date)
    @due_date = due_date
  end

  def lent_out?
    due_date != nil
  end

  def borrow
    return false if lent_out?
    Books.available.delete(self)
    Books.borrowed << self
    @due_date = Books.current_due_date
  end

  def return_to_library
    return false if !lent_out?
    Books.borrowed.delete(self)
    Books.available << self
    @due_date = nil
  end

end

house_of_leaves = Books.create("Lord of the Rings", "JRR Tolkien", "123456789")
snowcrash = Books.create("Harry Potter", "JK Rowling", "23485792")
imperialism = Books.create("Hunger Games", "Suzanne Collins", "123723123")
another_roadside_attraction = Books.create("The Cat in the Hat", "Dr. Seuss", "231726571")

Books.available.each do |book|
  puts book.inspect
end
Books.borrowed.inspect
