class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title:, author:)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
       'title' => @title,
       'author' => @author
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['title'], object['author'])
  end
end
