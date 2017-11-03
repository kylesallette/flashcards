require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require 'pry'


class CardTest < Minitest::Test



  def test_that_question_exists

    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
  end

  def test_that_answer_exists

    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "Juneau", card.answer
  end 

end
