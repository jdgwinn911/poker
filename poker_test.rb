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
        assert_equal("2C", deck.card_deck[0].card_name)
        assert_equal("Hearts", deck.card_deck[26].card_shapes)
        assert_equal("5", deck.card_deck[3].card_value)
        assert_equal(52, deck.card_deck.length)
        assert_equal("4C", deck.card_deck[2].card_name)
        assert_equal("Diamonds", deck.card_deck[13].card_shapes)
        assert_equal("9", deck.card_deck[7].card_value)
    end

    def test_that_deck_shuffles
        d = Deck.new
        s = Deck.new
        s.shuffle_deck()
        refute_equal(d, s)

    end

    def test_that_hand_has_been_dealt_5_cards
       z = Deck.new 
       z.shuffle_deck()
       y = z.deal_hand()
        assert_equal(5, y.x.length)
    end 

   def test_that_the_other_hand_gets_dealt
        v = Deck.new
        v.shuffle_deck()
        o = v.deal_hand()
        assert_equal(5, o.x.length)
    end

    def test_that_the_deck_length_has_changed
        d = Deck.new
        d.shuffle_deck()
        y = d.deal_hand()
        c = d.deal_hand()
        assert_equal(42, d.card_deck.length)
    end

    def test_that_card_exists_in_hand
        g = Deck.new
        g.shuffle_deck()
        k = g.deal_hand()
        assert_equal(Cards, k.x[0].class)
    end

    def test_that_hand_is_a_straigh_flush
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("2", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("3", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("4", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("5", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "H"))
        game = Rules.new
        assert_equal(true, game.straight_flush(temp))
    end

    def test_that_strt_flush_has_high_card
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("2", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("3", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("5", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("4", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "H"))
        game = Rules.new
        assert_equal("6 of Hearts", game.high_card_strt_flush(temp))
    end

    def test_that_hand_is_4_of_a_kind
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("2", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "D"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("8", "S"))
        game = Rules.new
        assert_equal(true, game.four_of_a_kind(temp))
    end

    def test_that_four_of_a_kind_has_high_card
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("2", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("8", "D"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "S"))
        game = Rules.new
        assert_equal("8 of Spades", game.four_of_a_kind_high_card(temp))
    end

    def test_that_hand_is_a_full_house
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("4", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("4", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("4", "D"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "S"))
        game = Rules.new
        assert_equal(true, game.full_house(temp))
    end

    def test_that_full_house_has_high_card
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("4", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("4", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("4", "D"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "S"))
        game = Rules.new
        assert_equal("4 of Spades", game.full_house_high_card(temp))
    end


    def test_that_hand_is_flush
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("4", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("5", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("7", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("8", "S"))
        game = Rules.new
        assert_equal(true, game.flush(temp))
    end

    def test_that_flush_has_high_card
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("5", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("4", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("8", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("7", "S"))
        game = Rules.new
        assert_equal("8 of Spades", game.high_card_flush(temp))
    end

    def test_that_hand_is_a_straight
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("2", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("3", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("4", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("5", "D"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "S"))
        game = Rules.new
        assert_equal(true, game.straight(temp))
    end

    def test_that_straight_has_high_card
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("2", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("3", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("4", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("5", "D"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "S"))
        game = Rules.new
        assert_equal("6 of Spades", game.straight_high_card(temp))
    end


    def test_that_hand_has_three_of_a_kind
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("2", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("3", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "D"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "S"))
        game = Rules.new
        assert_equal(true, game.three_of_a_kind(temp))
    end

    def test_that_3_of_a_kind_has_high_card
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("3", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "D"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "S"))
        game = Rules.new
        assert_equal("2 of Spades", game.three_of_a_kind_high_card(temp))

    end



    def test_that_hand_is_two_pair
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("5", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("5", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "D"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "S"))
        game = Rules.new
        assert_equal(true, game.two_pair(temp))
    end

    def test_that_hand_isnt_two_pair
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("5", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("7", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("4", "D"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "S"))
        game = Rules.new
        assert_equal(false, game.two_pair(temp))
    end

    def test_that_two_pair_has_high_card_1
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("3", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("3", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "D"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "S"))
        game = Rules.new
        assert_equal("3", game.two_pair_high_card(temp, 1 ))
    end


    def test_that_two_pair_has_high_card_2
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("3", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("3", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "D"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "S"))
        game = Rules.new
        assert_equal("2", game.two_pair_high_card(temp, 2 ))
    end

    def test_that_two_pair_has_high_card_3
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("3", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("3", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "D"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "S"))
        game = Rules.new
        assert_equal("6", game.two_pair_high_card(temp, 3 ))
    end


    def test_that_hand_is_pair
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("7", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("5", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "D"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "S"))
        game = Rules.new
        assert_equal(true, game.pair(temp))
    end

    def test_that_two_pair_has_high_card_
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("8", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("7", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("3", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("7", "D"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "S"))
        game = Rules.new
        assert_equal("7", game.pair_high_card(temp, 1))
    end


    def test_that_high_card_function_works
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("8", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("3", "S"))
        temp.add_dem_cards_to_da_hand(Cards.new("4", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("7", "D"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "S"))
        game = Rules.new
        assert_equal(8, game.high_card(temp))
    end

    def test_that_hand_has_ranking_system
        temp = Hand.new
        temp.add_dem_cards_to_da_hand(Cards.new("2", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("6", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("8", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("5", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("4", "H"))
        game = Rules.new
        assert_equal(0, game.hand_rank(temp).last())
    end


    def test_that_there_is_a_winner
        temp = Hand.new
        temp2 = Hand.new
        temp2.add_dem_cards_to_da_hand(Cards.new("2", "S"))
        temp2.add_dem_cards_to_da_hand(Cards.new("6", "H"))
        temp2.add_dem_cards_to_da_hand(Cards.new("8", "C"))
        temp2.add_dem_cards_to_da_hand(Cards.new("5", "D"))
        temp2.add_dem_cards_to_da_hand(Cards.new("4", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("2", "C"))
        temp.add_dem_cards_to_da_hand(Cards.new("3", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("8", "D"))
        temp.add_dem_cards_to_da_hand(Cards.new("9", "H"))
        temp.add_dem_cards_to_da_hand(Cards.new("9", "S"))

        game = Rules.new
        assert_equal(0, game.play_game(temp, temp2))
    end


end
