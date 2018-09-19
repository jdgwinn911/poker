require "minitest/autorun"
require_relative "poker1.rb"

class Poker1 < Minitest::Test
    def test_card_name
        x = Cards.new("3", "D")
        assert_equal("3D", x.card_name)
    end
    
    def test_card_value
        x = Cards.new("3", "H")
        assert_equal("3", x.card_value)
    end

    def test_for_suit
        x = Cards.new("3", "H")
        assert_equal("Hearts", x.card_shapes)
    end

    def test_that_card_has_value
        x = Cards.new("J", "C")
        assert_equal("11", x.card_value)
    end
    def test_the_hand
        x = Hand.new
        assert_equal(Hand, x.class)
    end

    def test_the_hand_2
        y = Hand.new
        assert_equal(Array, y.x.class)
    end

    def test_that_hand_can_hold
        hand = Hand.new
        card = Cards.new("J", "H")
        hand.add_dem_cards_to_da_hand(card)
        assert_equal(Cards, hand.x[0].class)
        assert_equal("JH", hand.x[0].card_name)
    end

    def test_that_deck_has_cards
        deck = Deck.new
        assert_equal(Cards, deck.card_deck[0].class)
        assert_equal(Cards, deck.card_deck[0].card_name)
    end

end
