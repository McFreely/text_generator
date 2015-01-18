require "minitest/autorun"

require "text_generator"

class MarkovTest < Minitest::Unit::TestCase

  def setup
    @text = "Le chat aime les souris vertes et grasses"
    @text_array = @text.split(" ")
    @n = rand(1..5)
    @genmax = rand(1..50)
    @generator = MarkovGenerator.new(@n, @genmax)
    @generator.feed(@text)
  end

  def test_tokenize_is_correct
    assert_equal @generator.tokenize(@text), @text_array
  end

  def test_feed_line
    assert_equal @generator.beginnings, [@text_array.first(@n)]
  end

  def test_ngram_length
    @generator.ngrams.each_key do |k|
      assert_equal k.length, @n
    end
  end

  def test_genmax
    sentence = @generator.generate.split(" ")
    assert_operator sentence.length, :<=, @genmax
  end
end


  
  