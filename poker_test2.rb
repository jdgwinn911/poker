require "minitest/autorun"
require_relative "poker2.rb"

class Poker2 < Minitest::Test
    def test_that_hand_is_getting_cards
    temp = Deck.new
    temp_arr = []
    temp_arr << Cards.new("4", "Clubs")
    temp_arr << Cards.new("3", "Spades")
    temp_arr << Cards.new("5", "Hearts")
    temp_arr << Cards.new("5", "Spades")
    temp_arr << Cards.new("8", "Diamonds")
    # temp.deal_hand(Cards.new("5", "S"))
    # temp.deal_hand(Cards.new("4", "H"))
    # temp.deal_hand(Cards.new("6", "C"))
    # temp.deal_hand(Cards.new("8", "D"))
    temp.deal_hand()
    game = Hand.new
    assert_equal("5 of Spades", game.hand_pair())
    end
end

