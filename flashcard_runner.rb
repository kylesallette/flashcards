require './lib/card'
require './lib/deck'
require './lib/guess'
require './lib/round'



card_1 = Card.new("What is the capital of Alaska?", "juneau")
card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
card_3 = Card.new("What is the most spoken language in the world?", "chinese")
card_4 = Card.new("What is the main color of the Chinese flag?", "red")
card_5 = Card.new("What city is the capital of China?", "beijing")
card_6 = Card.new("Which planet has the most moons?", "jupiter")

deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6])
guess = Guess.new("Juneau", [card_1, card_2, card_3, card_4, card_5, card_6])
round = Round.new(deck)


round.welcome_message
round.input
