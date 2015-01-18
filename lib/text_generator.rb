require "text_generator/version"

class MarkovGenerator
  attr_accessor :ngrams, :beginnings, :genmax
  
  def initialize(n, genmax)
    @size = n
    @ngrams = {}
    @genmax = genmax
    @beginnings = []
  end

  def tokenize(line)
    line.strip.split(" ")
  end

  def feed(line)
    tokens = tokenize(line)

    return if tokens.length < @size

    @beginnings << tokens[0..@size-1]

    (0..(tokens.length - @size)).each do |i|
      ngram = tokens[i..i+@size-1].to_a 
      next_gram = [tokens[i+@size]]
      if @ngrams.has_key? ngram
        @ngrams[ngram] << next_gram 
      else
        @ngrams[ngram] = next_gram
      end
    end
  end

  def generate
    current = @beginnings.sample
    output = current.to_a
    while output.length <= @genmax-1
      if @ngrams.has_key? current
        possible_next = @ngrams[current].flatten
        next_gram = possible_next.sample
        output << next_gram
        current = output.last(@size)
      else
        break
      end
    end
    return output.join(" ")
  end
end
