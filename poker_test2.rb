require "minitest/autorun"
require_relative "poker2.rb"

class Poker2 < Minitest::Test
    def test_that_hand_is_pair
    temp = Deck.new
    temp_arr = []
    temp_arr << ["2", "Clubs"]
    temp_arr << ["6", "Clubs"]
    temp_arr << ["9", "Diamonds"]
    temp_arr << ["3", "Hearts"]
    temp_arr << ["9", "Spades"]
    temp.deal_hand(temp_arr)
    game = Hand.new
    assert_equal(1, temp.hand.pair())
    end


    def test_that_hand_is_three_of_a_kind
        temp = Deck.new
        temp_arr = []
        temp_arr << ["4", "Clubs"]
        temp_arr << ["3", "Clubs"]
        temp_arr << ["4", "Diamonds"]
        temp_arr << ["4", "Hearts"]
        temp_arr << ["9", "Spades"]
        temp.deal_hand(temp_arr)
        game = Hand.new
        assert_equal(1, temp.hand.three_of_a_kind())
    end


    def test_that_hand_is_four_of_a_kind
        temp = Deck.new
        temp_arr = []
        temp_arr << ["7", "Clubs"]
        temp_arr << ["3", "Clubs"]
        temp_arr << ["7", "Diamonds"]
        temp_arr << ["7", "Hearts"]
        temp_arr << ["7", "Spades"]
        temp.deal_hand(temp_arr)
        game = Hand.new
        assert_equal(1, temp.hand.four_of_a_kind())
    end


    def test_for_two_pair
    temp = Deck.new
    temp_arr = []
    temp_arr << ["4", "Clubs"]
    temp_arr << ["3", "Clubs"]
    temp_arr << ["4", "Diamonds"]
    temp_arr << ["6", "Hearts"]
    temp_arr << ["6", "Spades"]
    temp.deal_hand(temp_arr)
    game = Hand.new
    assert_equal(1, temp.hand.two_pair())
    end

    
    def test_for_full_house
        temp = Deck.new
        temp_arr = []
        temp_arr << ["3", "Clubs"]
        temp_arr << ["3", "Diamonds"]
        temp_arr << ["4", "Diamonds"]
        temp_arr << ["3", "Hearts"]
        temp_arr << ["4", "Spades"]
        temp.deal_hand(temp_arr)
        game = Hand.new
        assert_equal(1, temp.hand.full_house())
    end

    def test_for_full_house
        temp = Deck.new
        temp_arr = []
        temp_arr << ["3", "Clubs"]
        temp_arr << ["8", "Clubs"]
        temp_arr << ["6", "Clubs"]
        temp_arr << ["2", "Clubs"]
        temp_arr << ["9", "Clubs"]
        temp.deal_hand(temp_arr)
        game = Hand.new
        assert_equal(1, temp.hand.flush())
    end

    def test_for_hi_hand
        temp = Deck.new
        temp_arr = []
        temp_arr << ["3", "Clubs"]
        temp_arr << ["8", "Clubs"]
        temp_arr << ["6", "Clubs"]
        temp_arr << ["2", "Clubs"]
        temp_arr << ["9", "Clubs"]
        temp.deal_hand(temp_arr)
        game = Hand.new
        assert_equal(23689, temp.hand.hi_hand(temp_arr))

    end

    def test_for_straight
        temp = Deck.new
        temp_arr = []
        temp_arr << ["3", "Hearts"]
        temp_arr << ["4", "Spades"]
        temp_arr << ["5", "Clubs"]
        temp_arr << ["6", "Diamonds"]
        temp_arr << ["7", "Clubs"]
        temp.deal_hand(temp_arr)
        game = Hand.new
        assert_equal(1, temp.hand.straight())
    end

    def test_for_straight_flush
        temp = Deck.new
        temp_arr = []
        temp_arr << ["3", "Clubs"]
        temp_arr << ["4", "Clubs"]
        temp_arr << ["5", "Clubs"]
        temp_arr << ["6", "Clubs"]
        temp_arr << ["7", "Clubs"]
        temp.deal_hand(temp_arr)
        game = Hand.new
        assert_equal(1, temp.hand.straight_flush())
    end

    def test_for_rank
        temp = Deck.new
        temp_arr = []
        temp_arr << ["3", "Clubs"]
        temp_arr << ["4", "Clubs"]
        temp_arr << ["5", "Clubs"]
        temp_arr << ["6", "Clubs"]
        temp_arr << ["7", "Clubs"]
        temp.deal_hand(temp_arr)
        game = Hand.new
        assert_equal(1110134567, temp.hand.ranks())
    end

    def test_for_rank
        temp = Deck.new
        temp_arr = []
        temp_arr2 = []
        temp_arr << ["4", "Clubs"]
        temp_arr << ["4", "Hearts"]
        temp_arr << ["4", "Diamonds"]
        temp_arr << ["4", "Spades"]
        temp_arr << ["7", "Clubs"] 

        temp_arr2 << ["2", "Spades"]
        temp_arr2 << ["2", "Diamonds"]
        temp_arr2 << ["5", "Hearts"]
        temp_arr2 << ["5", "Clubs"]
        temp_arr2 << ["2", "Hearts"]
        y = temp.deal_hand(temp_arr)
        puts y.ranks
        z = temp.deal_hand(temp_arr2)
        puts z.ranks
        game = Hand.new
        assert_equal(true, y.ranks() > z.ranks())
    end

end

