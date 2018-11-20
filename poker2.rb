class Cards
    def initialize(value, suit)
    end
    CARDVAL = %i[2 3 4 5 6 7 8 9 10 11 12 13 14]
    CARDSUIT = %i[Spades Clubs Diamonds Hearts]
    Card = Struct.new(:value, :suit) do
        def to_s() # redefine to_s  to bring back cards as strings
            "#{value.capitalize} of #{suit.capitalize}"
        end
        def ==(other) # avoiding dynamic constant error by looking value instead of object id
            self.value == other.value
        end
    end
end

class Deck < Cards
    def initialize()
    @hand = []
    @deck = CARDVAL.flat_map { |value| CARDSUIT.map{|suit| Card.new(value, suit)}} 
     @shuffled = @deck.shuffle
    end
    
    def deal_hand()
        hand = Hand.new
     5.times do
        hand << @shuffled.pop()
     end
     return hand
    end
    attr_reader :deck
    attr_reader :shuffled
    attr_reader :hand
end

class Hand < Deck
    def initialize()
        @cards = []
    end

    def to_s()
        stwing = ""
        @cards.each do |v|
            stwing += "#{v}\n"
        end
        return stwing
    end
    def <<(other_card)
        @cards << other_card
    end

    def hand_pair() # must return true 

    end

    ranks = {straight_flush:  8, four_of_a_kind: 7, full_house: 6,
        flush:5, straight: 4, three_of_a_kind: 3,
        two_pair: 2, pair: 1
    }.freeze
end
d = Deck.new
white = d.deal_hand(); puts white
puts "------"
black = d.deal_hand(); puts black



