# cards,hand,deck,game rules
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
        hand.x.each_with_index do |v, i|
            temp_value << v.card_value.to_i
        end
        temp_value.sort()
        return temp_value.last()

    end

    def four_of_a_kind(hand)
        temp_value = []
        temp_suit = []
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
            if counter == 4
                return true
            else
                 break
            end
        end
        false
    end

    def four_of_a_kind_high_card(hand)
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
                p temp_value
                if temp_value[0] == temp_value[1]
                    return true
                else 
                    break
                end
            end
        end
        
        false 
    end





end