require 'minitest/autorun'
require 'minitest/pride'
require '../lib/deck'
require '../lib/card'
require '../lib/guess'
require '../lib/round'
require 'pry'


class RoundTest < Minitest::Test

  def test_for_deck

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)



    assert_equal "What is the capital of Alaska?", round.current_card.question
    assert_equal  "Juneau", round.current_card.answer

    round.next_card

    assert_equal "Approximately how many miles are in one astronomical unit?", round.current_card.question
    assert_equal "93,000,000", round.current_card.answer
  end


  def test_that_guess_is_empty

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_recording_guesses

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    guess = Guess.new("Juneau", [card_1,card_2])
    round = Round.new(deck)

    round.record_guess("Juneau")

    assert_equal "Juneau", guess.response
  end

  def test_number_of_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    guess = Guess.new("Juneau", [card_1,card_2])
    round = Round.new(deck)


    round.record_guess("Juneau")

    assert_equal 1, round.guesses.count
  end

  def test_that_guess_is_correct

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    guess = Guess.new("Juneau", [card_1,card_2])
    round = Round.new(deck)


    round.record_guess("Juneau")

    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_that_cards_switch

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    guess = Guess.new("Juneau", [card_1,card_2])
    round = Round.new(deck)

    round.next_card

    assert_equal "93,000,000", round.current_card.answer
  end

end
