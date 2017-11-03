require_relative 'guess'
require_relative 'deck'
require_relative 'card'


class Round


  attr_reader :deck,
              :guesses,
              :welcome_message,
              :input,
              :round,
              :response,
              :correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card = 0
    @number_correct = 0
    @number_incorrect = 0
    @percent_correct = 0
    @round = round
    @response = response
    @correct = correct
    @count_down = 5
  end

  def welcome_message
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts "--------------------------------------"
    puts "Please type start to play."
    puts "Or quit to stop playing."
  end


  def input
    while(command = gets.chomp.downcase)
    @response = command.downcase
    break if @count_down == 0

    if @response == "start"
      start
    elsif @response == current_card.answer
      p feedback
      @number_correct += 1
      @count_down -= 1
      next_card
      start
    elsif @response != correct
     p feedback
     @number_incorrect += 1
     @count_down -= 1
     next_card
     start
    end
    end
     puts "****** Game over! ******"
     puts "You had #{@number_correct} correct guesses out of 6."
  end


  def current_card
    deck.cards[@current_card]
  end

  def next_card
    @current_card += 1
  end


  def record_guess(response)
    new_guess = Guess.new(response, current_card)
    @guesses << new_guess
        @guesses
  end


  def correct?
     @response == current_card.answer
  end


  def feedback
     @response == current_card.answer ? "Correct!" : "Incorrect."
  end


  def start
     p current_card.question
  end

end
