require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require '../lib/guess'
require '../lib/card'


class GuessTest < Minitest::Test

  def test_that_guess_takes_in_response

    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    guess.card

    assert_equal "Juneau" , guess.response
  end

  def test_that_answer_matches_user_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    guess.card

    assert guess.correct?
  end

  def test_for_correct_feedback_when_true
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    guess.correct?
    assert_equal "Correct!", guess.feedback
  end

  def test_for_correct_feedback_when_false
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Madison", card)

    guess.correct?
    assert_equal "Incorrect.", guess.feedback
  end


end
