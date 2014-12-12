class Book
  def pages
    100
  end

  def publish
    true
  end
end

class Publisher
  def initialize(book)
    @book = book
  end

  def publish
    @book.publish
  end
end

RSpec.describe 'mocks and stubs' do
  example 'create an arbitrary object' do
    book = double('book', publish: true)
    expect(book.publish).to eq true
  end

  example 'dynamic return values' do
    book = double('book')
    allow(book).to receive(:publish) { |year| year > 1990 }
    expect(book.publish 1991).to eq true
    expect(book.publish 1990).to eq false
  end

  example 'stubbing existing methods' do
    expect(Book.new).to be_a_kind_of Book
    allow(Book).to receive(:new).and_return(:not_a_book)
    expect(Book.new).to eq :not_a_book
  end

  example 'stubbing when you don\'t have access to the instance' do
    allow_any_instance_of(Book).to receive(:publish).and_return(true)
    expect(Book.new.publish).to eq true
  end

  example 'stubbing doesn\'t verify the invocation, use `expect` for that' do
    book = double 'book'
    expect(book).to receive(:publish)
    Publisher.new(book).publish
  end

  example 'invocation matchers' do
    book = double 'book'
    expect(book).to receive(:publish).twice
    book.publish
    book.publish
  end

  describe 'verified mock' do
    example 'you can\'t stub methods that don\'t exist on the real object' do
      book = instance_double Book, pages: 200 # if this was num_pages, it would fail
      expect(book.pages).to eq 200
    end

    example 'you can\'t call methods that aren\'t stubbed, unless you declare it a "null object"' do
      book = instance_double Book
      expect { book.publish }.to raise_error # haven't stubbed publish

      book.as_null_object
      book.publish
    end
  end
end
