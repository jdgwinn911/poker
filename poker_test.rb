require "minitest/autorun"
require_relative "poker1.rb"

class Poker1 < Minitest::Test
    def test_card_name
        x = Cards.new("3", "D")
        assert_equal("3D", x.card_name)
    end
end
