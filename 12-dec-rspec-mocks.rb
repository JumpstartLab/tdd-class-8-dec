# https://github.com/rspec/rspec-mocks

class Book
  def rspec_book
    123
  end

  def pages
    456
  end
end

RSpec.describe 'Mock examples' do
  example 'create an arbitrary object' do
    user = double('user', name: 'Josh')
    expect(user.name).to eq 'Josh'
  end

  example 'dynamic return values' do
    reverser = double('reverser')
    allow(reverser).to receive(:reverse) { |reversable| reversable.reverse }
    expect(reverser.reverse 'abc').to eq 'cba'
  end

  example 'stubbing existing methods' do
    book = Book.new
    allow(book).to receive(:pages).and_return(900)
    expect(book.pages).to eq 900
  end

  example 'stubbing when you don\'t have access to the instance' do
    allow_any_instance_of(Book).to receive(:pages).and_return(100)
    expect(Book.new.pages).to eq 100
  end

  example 'stubbing doesn\'t verify the invocation, use `expect` for that' do
    book = Book.new
    expect(book).to receive(:pages).and_return(900)
    book.pages # this test would fail if we didn't call book.pages
  end

  describe 'verified mock' do
    example 'you can override its methods with a stub' do
      book = instance_double("Book", pages: 250)
      expect(book.pages).to eq 250
    end

    example 'you can\'t call methods that aren\'t stubbed' do
      book = instance_double("Book", pages: 250)
      expect { book.rspec_book }.to raise_error
    end

    example 'you can\'t stub methods that don\'t exist on the real object' do
      expect { instance_double("Book", num_pages: 250) }
        .to raise_error
    end
  end
end
