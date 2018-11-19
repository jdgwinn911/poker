require "minitest/autorun"
require_relative "poker2.rb"

class Poker2 < Minitest::Test

    def test_that_hash_is_hash
        x = Hand.new
        
        assert_equal(Hash, x.ranky().class)
    end



end