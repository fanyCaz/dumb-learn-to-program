class Document
  attr_accessor :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end

  def word_count
    words.size
  end

  def author_name(names)
    @author += "#{names.join(' ')}"
  end

  def index_for(word)
    p words.find_index(word)
  end

  def average_word_length
    # Adding the '0.0' makes the output values as float
    p "My approach"
    p words.map{ |word| word.size }.sum(0.0) / word_count
    p "Book approach, "
    p words.inject(0.0){ |result, word| word.size + result } / word_count
  end
end
