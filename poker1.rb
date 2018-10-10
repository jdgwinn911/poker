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

    def straight_flush(hand)
    end
end