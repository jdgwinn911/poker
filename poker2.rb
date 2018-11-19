class Card
    def initialize()
    end
    CARDVAL = %i[2 3 4 5 6 7 8 9 10 11 12 13 14]
    CARDSUIT = %i[spades clubs diamonds hearts]
    Card = Struct.new(:number, :shape) do
        def to_s() # redefine to_s  to bring back cards as strings
            "#{number.capitalize} of #{shape.capitalize}"
        end
        def ==(other) # avoiding dynamic constant error by looking value instead of object id
            self.number == other.number &&
            self.shape == other.shape
        end
    end
end



class Deck < Card
    def initialize()
    @deck = CARDVAL.flat_map { |number| CARDSUIT.map{|shape| Card.new(number, shape)}} 
     @shuffled = @deck.shuffle
    end
    
    

    def deal_hand()
     hand = []
     5.times do
        hand << @shuffled.pop().to_s
     end
     puts hand
    end
    attr_reader :deck
    attr_reader :shuffled
end

class Hand < Deck
    def initialize()
    end
    d = Deck.new
    white = d.deal_hand()
    puts "------"
    black = d.deal_hand()

    # attr_reader :deck
    # attr_reader :shuffled
end



