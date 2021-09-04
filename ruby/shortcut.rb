require_relative 'document'
require 'set'
# The same output, different approaches
# arrays

words = ['jose','trigo','no','lo','conozco']

p words

words = %w[jose trigo no lo conozco]

p words

# hash

book_info = { :author => "Fernando del Paso", :name => "Jose Trigo" }
p book_info
book_info = { author: "Fernando del Paso", name: "Jose Trigo" }
p book_info

def print_words(*args)
  args.each{ |a| p a }
end

print_words(book_info)


doc = Document.new('Jose Trigo','fce', 'Jose Trigo? No lo conozco, necesito ver a Jose Trigo')
doc.author_name(%w[Fernando del Paso])

book_info.each{ |key,val| p "#{key} : #{val}" }

doc.index_for('lo')

doc.average_word_length

# misc methods

positives = [ 0, -10, -9, 2, 4]
positives = positives.select{ |p| p >= 0 }
p positives

positives = [ 0, -10, -9, 2, 4]
p positives.delete_if{ |p| p < 0 }

# set

not_repeated_words = Set.new( doc.words )
p not_repeated_words
