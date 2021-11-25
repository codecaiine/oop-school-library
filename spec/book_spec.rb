require_relative '../book'

describe Book do
  before :each do
    @book = Book.new(title: 'Spider Man', author: 'Marvel')
  end

  it 'show book instance' do
    expect(@book).to be_instance_of Book
  end

  it 'confirm book title' do
    expect(@book.title).to match 'Spider Man'
  end

  it 'confirm author si Marvel' do
    expect(@book.author).to match 'Marvel'
  end
end
