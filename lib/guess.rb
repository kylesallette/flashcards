require_relative 'card'
require_relative 'round'
require_relative 'guess'

class Guess



  attr_reader :response,
              :card,
              :correct,
              :guess,
              :feedback

  def initialize(response,card)
    @card = card
    @response = response
    @correct = correct
    @guess = guess
  end

  def correct?
     @response == card.answer
  end

  def feedback
     @response == card.answer ? "Correct!" : "Incorrect."
  end

end
