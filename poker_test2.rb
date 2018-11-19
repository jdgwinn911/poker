require "minitest/autorun"
require_relative "poker2.rb"

class Poker2 < Minitest::Test
    def test_that_hand_is_getting_cards
    temp = Hand.new
    temp.deal_card(Cards.new("5", "S"))
    temp.deal_card(Cards.new("4", "S"))
    temp.deal_card(Cards.new("6", "S"))
    temp.deal_card(Cards.new("8", "S"))
    temp.deal_card(Cards.new("7", "S"))
    game = Hand.new
    assert_equal("8 of Spades", game.phand(temp))
    end
end

