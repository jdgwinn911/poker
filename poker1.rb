class Cards
    def initialize(number,shapes)
        @card_name = "#{number}#{shapes}"
        @card_value = "#{number}"
        case number
        when "T"
            @card_value = "10"
        when "K"
            @card_value = "13"
        when "Q"
            @card_value = "12"
        when "J"
            @card_value = "11"
        when "A"
            @card_value = "14"
        end

        @card_shapes = ""
        case shapes 
        when "H"
            @card_shapes = "Hearts"
        when "C"
            @card_shapes = "Clubs"
        when "D"
            @card_shapes =  "Diamonds"
        when "S"
            @card_shapes = "Spades"
        end
    end
    attr_reader :card_name
    attr_reader :card_value
    attr_reader :card_shapes
end

class Hand
    def initialize()
        @x = []
    end
    def add_dem_cards_to_da_hand(card)
        @x << card 
    end 

    attr_reader :x
end

class Deck
    def initialize()
        @card_deck = []
        card_value = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
        card_suits = ['C', 'D', 'H', 'S']
        card_suits.each do |suit|
            card_value.each do |val|
                @card_deck << Cards.new(val, suit)
            end
            @card_deck
        end
    end

    def shuffle_deck()
        @card_deck.shuffle!
    end

    def deal_hand()
        shuffle_deck()
      y = Hand.new
        5.times do 
         y.add_dem_cards_to_da_hand(@card_deck.pop())
        end
        return y 
    end
    attr_reader :card_deck
end

class Rules
    def initialize()
    end

    def array_increments_by?(step, array)
        sorted = array.sort
        lastNum = sorted[0]
        sorted[1, sorted.count].each do |n|
          if lastNum + step != n
            return false
          end
          lastNum = n
        end
        true
      end

    def straight_flush(hand)
        temp_value = []
        temp_suit = []
        hand.x.each_with_index do |v, i|
            temp_value << v.card_value.to_i
            temp_suit << v.card_shapes
        end
        if temp_suit.all? {|v| v == temp_suit[0]} && array_increments_by?(1, temp_value)
            return true
        end
        false
         
    end

    def high_card_strt_flush(hand)
        temp_value = []
        temp_suit = []
        hand.x.each_with_index do |v, i|
            temp_suit << v.card_shapes
            temp_value << v.card_value.to_i
        end
        temp_value.sort()
        return "#{temp_value.last()} of #{temp_suit[0]}"

    end

    def four_of_a_kind(hand)
        temp_value = []
        hand.x.each_with_index do |v, i|
            temp_value << v.card_value
        end
        temp_value.each_with_index do |v, i|
            counter = 0
            temp_value.each do |k|
                if v == k 
                    counter += 1 
                end
            end
            if counter == 4
                return true
            end
        end
        false
    end

    def four_of_a_kind_high_card(hand)
        temp_value = []
        temp_suit = []
        hand.x.each_with_index do |v, i|
            temp_suit << v.card_shapes
            temp_value << v.card_value.to_i
        end
        return "#{temp_value.sort().last()} of #{temp_suit[4]}"
    end


    def full_house(hand)
        temp_suit = []
        temp_value = []
        hand.x.each_with_index do |v, i|
            temp_suit << v.card_shapes
            temp_value << v.card_value
        end
        temp_value.each_with_index do |v, i|
            counter = 0
            temp_value.each do |k|
                if v == k 
                    counter += 1 
                end
            end
            if counter == 3 
                temp_value.delete(v)
                if temp_value[0] == temp_value[1]
                    return true
                end
            end
        end
        false 
    end

    def full_house_high_card(hand)
        temp_value = []
        temp_suit = []
        hand.x.each_with_index do |v, i|
            temp_suit << v.card_shapes
            temp_value << v.card_value.to_i
            counter = 0
            temp_value.each_with_index do |v, i|
                counter = 0
                temp_value.each do |k|
                    if v == k 
                        counter += 1 
                    end
                end
                if counter == 3 
                    return "#{temp_value.last()} of #{temp_suit[0]}"
                end
            end
        end
    end

    def flush(hand)
        temp_suit = []
        temp_value = []
        hand.x.each_with_index do |v, i|
            temp_suit << v.card_shapes
            temp_value << v.card_value
        end
        if temp_suit.all? {|v| v == temp_suit[0]}
            return true
        else 
            false
        end
    end

    def high_card_flush(hand)
        temp_value = []
        temp_suit = []
        hand.x.each_with_index do |v, i|
            temp_suit << v.card_shapes
            temp_value << v.card_value.to_i
        end
        return "#{temp_value.sort().last()} of #{temp_suit[0]}"

    end

    def straight(hand)
        temp_value = []
        temp_suit = []
        hand.x.each_with_index do |v, i|
            temp_value << v.card_value.to_i
            temp_suit << v.card_shapes
        end
        if temp_suit && array_increments_by?(1, temp_value)
            p temp_value
            return true
        end
        false
    end

    def straight_high_card(hand)
        temp_value = []
        temp_suit = []
        hand.x.each_with_index do |v, i|
            temp_suit << v.card_shapes
            temp_value << v.card_value.to_i
        end
        if temp_suit && array_increments_by?(1, temp_value)
            high_num = temp_value.sort().last()
            place_holder = temp_value.index(high_num)
            right_suit = temp_suit[place_holder]
        return "#{high_num} of #{right_suit}"
        end

    end

    def three_of_a_kind(hand)
        temp_value = []
        hand.x.each_with_index do |v, i|
            temp_value << v.card_value
        end
        temp_value.each_with_index do |v, i|
            counter = 0
            temp_value.each do |k|
                if v == k 
                    counter += 1 
                end
            end
            if counter == 3
                return true
            end
        end
        false
    end

    def three_of_a_kind_high_card(hand)
        temp_value = []
        temp_suit = []
        hand.x.each_with_index do |v, i|
            temp_suit << v.card_shapes
            temp_value << v.card_value.to_i
            counter = 0
            temp_value.each_with_index do |v, i|
                counter = 0
                temp_value.each do |k|
                    if v == k 
                        counter += 1 
                    end
                end
                if counter == 3 
                    high_num = temp_value.last()
                    place_holder = temp_value.index(high_num)
                    right_suit = temp_suit[place_holder]
                return "#{high_num} of #{right_suit}"
                end
            end
        end
    end


    def two_pair(hand)
        arr = []
        temp_value = []
        hand.x.each_with_index do |v, i|
            temp_value << v.card_value
        end
        temp_value.each do |k|
            counter = 0
            temp_value.each do |z|
                if z == k 
                    counter += 1
                end
            end
            if counter == 2 
                arr << k 
                temp_value.delete(k)
            end
            if arr.length == 2
                return true 
            end
        end
        false
    end

    def two_pair_high_card(hand, compares)
        temp_value = []
        temp_suit = []
        arr = []
        hand.x.each_with_index do |v, i|
            temp_value << v.card_value
        end
        temp_value.each do |k|
            counter = 0
            temp_value.each do |z|
                if z == k 
                    counter += 1
                end
            end
            if counter == 2 
                arr << k 
                temp_value.delete(k)
            end
            if arr.length == 2
                if compares != 3
                    return arr.sort()[-compares]
                else 
                    temp_value.each_with_index do |v, i|
                        if arr [i] != temp_value[i]
                            return v 
                        end
                    end
                end
                            
            end
        end

    end

    def two_pair_high_card2(hand)
        temp_value = []
        temp_suit = []
        arr1 = []
        hand.x.each_with_index do |v, i|
            temp_value << v.card_value
        end
        temp_value.each do |val|
            counter = 0
            temp_value.each do |val2|
                if val == val2 
                    counter += 1
                end
            end
            if counter == 2
                arr1 << val
                temp_value.delete(val)
            end
        end
        return arr1.sort().first
    end 

    def two_pair_high_card3(hand)
        temp_value = []
        temp_suit = []
        arr2 = []
        hand.x.each_with_index do |v, i|
            temp_value << v.card_value
        end
        temp_value.each do |val|
            temp_value.each do |val2|
                if val == val2 
                    temp_value.delete(val)
                end
            end
        end
        return temp_value.last
    end



    def pair(hand)
        temp_suit = []
        temp_value = []
        hand.x.each_with_index do |v, i|
            temp_suit << v.card_shapes
            temp_value << v.card_value
        end
        temp_value.each_with_index do |v, i|
            counter = 0
            temp_value.each do |k|
                if v == k 
                    counter += 1 
                end
            end
            if counter == 2
                return true 
            end
        end
        false 
    end

    def pair_high_card(hand)
        temp_value = []
        temp_suit = []
        arr = []
        hand.x.each_with_index do |v, i|
            temp_value << v.card_value
        end
        temp_value.each do |k|
            counter = 0
            temp_value.each do |z|
                if z == k 
                    counter += 1
                end
            end
            if counter == 2 
                arr << k 
            end
            if arr.length == 2
                return arr.sort().last()            
            end
        end
    end

    def pair_high_card2(hand)
        temp_value = []
        temp_suit = []
        arr = []
        hand.x.each_with_index do |v, i|
            temp_value << v.card_value
        end
        temp_value.each do |k|
            counter = 0
            temp_value.each do |z|
                if z == k 
                    counter += 1
                end
            end
            if counter == 2 
                arr << k 
            end
            if arr.length == 2
                return arr.sort().first()            
            end
        end
    end

    def pair_high_card3(hand)
        temp_value = []
        temp_suit = []
        hand.x.each_with_index do |v, i|
            temp_value << v.card_value
        end
        temp_value.each do |k|
            counter = 0
            temp_value.each do |z|
                if z == k 
                    counter += 1
                end
            end
            if counter == 2 
                temp_value.delete(k)
            end            
        end
        return temp_value.sort()
    end

    
    def high_card(hand)
        temp_value = []
        temp_suit = []
        hand.x.each_with_index do |v, i|
            temp_suit << v.card_shapes
            temp_value << v.card_value.to_i
        end
        return temp_value.sort().last()
    end
        


    def hand_rank(hand)
        if straight_flush(hand) 
           return 8
        elsif four_of_a_kind(hand) 
            return 7
        elsif full_house(hand) 
            return 6
        elsif flush(hand) 
            return 5
        elsif straight(hand) 
            return 4
        elsif three_of_a_kind(hand) 
            return 3
        elsif two_pair(hand) 
            return 2
        elsif pair(hand) 
            return 1
        else high_card(hand)
            return 0
        end
    end

    def play_game(hand1, hand2)
        player1 = hand_rank(hand1)
        player2 = hand_rank(hand2)
        if player1 > player2
            return "Player 1 Won!"
        elsif player2 > player1
            return "Player 2 Won!"
        elsif player1 == player2 && player1 == 0
             var = high_card(hand1).to_i
        elsif player2 == 0
            var1 = high_card(hand2).to_i
            temp1 = []
            temp2 = []
            hand1.x.each do |v|
                temp1 << v.card_value
            end
                hand2.x.each do |v|
                    temp2 << v.card_value
                end
                temp1 = temp1.sort!()
                temp2 = temp2.sort!()
                while var == var1
                    if temp1.length == 0 || temp2.length == 0
                        return "it's a tie!"
                    end
                    temp1.pop()
                    temp2.pop()
                    var = temp1.last()
                    var1 = temp2.last()
                end
            elsif player1 == player2 
                var = high_card(hand1).to_i
            elsif player1 == 1
                var = pair_high_card(hand1).to_i
            elsif player1 == 1
                var = pair_high_card2(hand1).to_i
            elsif player1 == 1
                var = pair_high_card3(hand1).to_i
            elsif player1 == 2
                var = two_pair_high_card(hand1, compares).to_i
            elsif player1 == 2 
                var = two_pair_high_card2(hand1).to_i
            elsif player1 == 2 
                var = two_pair_high_card3(hand1). to_i
            elsif player1 == 3
                var = three_of_a_kind_high_card(hand1).to_i
            elsif player1 == 4
                var = straight_high_card(hand1).to_i
            elsif player1 == 5
                var = high_card_flush(hand1).to_i
            elsif player1 == 6
                var = full_house_high_card(hand1).to_i
            elsif player1 == 7
                var = four_of_a_kind_high_card(hand1).to_i
            elsif player1 == 8
                var = high_card_strt_flush(hand1).to_i
            end
            if player2 == 0
                var1 = high_card(hand2).to_i
            elsif player2 == 1
                var1 = pair_high_card(hand2).to_i
            elsif player2 == 1
                var1 = pair_high_card2(hand2).to_i
            elsif player2 == 1
                var1 = pair_high_card3(hand2).to_i
            elsif player2 == 2 
                var1 = two_pair_high_card(hand2,compares).to_i
            elsif player2 == 2 
                var = two_pair_high_card2(hand2).to_i
            elsif player2 == 2 
                var = two_pair_high_card3(hand2).to_i
            elsif player2 == 3
                var1 = three_of_a_kind_high_card(hand2).to_i
            elsif player2 == 4
                var1 = straight_high_card(hand2).to_i
            elsif player2 == 5
                var1 = high_card_flush(hand2).to_i
            elsif player2 == 6
                var1 = full_house_high_card(hand2).to_i
            elsif player2 == 7
                var1 = four_of_a_kind_high_card(hand2).to_i
            elsif player2 == 8
                var1 = high_card_strt_flush(hand2).to_i
            end
            var = var.to_i
            var1 = var1.to_i
            if var > var1
                return "Player 1 Won!"
            elsif var1 > var
                return "Player 2 Won!"
            else
                return "it's a tie!"
            end
        end

        def why_win(hand)
        if hand_rank(hand) == 8
            return "Straight Flush"
        elsif hand_rank(hand) == 7
            return "Four of a kind"
        elsif hand_rank(hand) == 6
            return "Full House"
        elsif hand_rank(hand) == 5
            return "Flush"
        elsif hand_rank(hand) == 4
            return "Straight"
        elsif hand_rank(hand) == 3
            return "Three of a kind"
        elsif hand_rank(hand) == 2
            return "Two pair"
        elsif hand_rank(hand) == 1
            return "Pair"
        elsif hand_rank(hand) == 0
            return "Crappy hand"
        else 
            return hand_rank(hand)
        end
    end
    def actual_game_play()
        z = Deck.new
        @player1 = z.deal_hand()
        @player2 = z.deal_hand()
        play_game(@player1, @player2)
    end
    attr_reader :player1
    attr_reader :player2
end

# game = Rules.new
# p game.actual_game_play()
# p "player 1 hand is #{game.why_win(game.player1)}"
# game.player1.x.each do |v|
#     p "player1's cards are #{v.card_name}"
# end
# p "player 2 hand is #{game.why_win(game.player2)}"
# game.player2.x.each do |v|
#     p "player2's cards are #{v.card_name}"
# end
