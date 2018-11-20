require "minitest/autorun"
require_relative "poker2.rb"

class Poker2 < Minitest::Test
    def test_that_hand_is_pair
    temp = Deck.new
    temp_arr = []
    temp_arr << ["4", "Clubs"]
    temp_arr << ["3", "Clubs"]
    temp_arr << ["4", "Diamonds"]
    temp_arr << ["6", "Hearts"]
    temp_arr << ["9", "Spades"]
    temp.deal_hand(temp_arr)
    game = Hand.new
    assert_equal(true, temp.hand.pair())
    end


    # def test_for_two_pair
    # temp = Deck.new
    # temp_arr = []
    # temp_arr << ["4", "Clubs"]
    # temp_arr << ["3", "Clubs"]
    # temp_arr << ["4", "Diamonds"]
    # temp_arr << ["6", "Hearts"]
    # temp_arr << ["9", "Spades"]
    # temp.deal_hand(temp_arr)
    # game = Hand.new
    # assert_equal(true, temp.hand.hand_pair())
    # end
end

