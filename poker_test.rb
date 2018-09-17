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
        x = Cards.new("Hearts")
        assert_equal("Hearts", x.card_shapes)
    end

end
