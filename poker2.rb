class Game # a class that does what 2 classes used to do =)
    def initialize()
    end
    CARDVAL = %i[two three four five six seven eight nine ten jack queen king ace]
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


     deck = CARDVAL.flat_map { |number| CARDSUIT.map{|shape| Card.new(number, shape)}} # basically a double loop to flatten the mapped arrays to give 52 cards back
     shuffled = deck.shuffle

     hand = []
     5.times do
        hand << shuffled.pop().to_s
     end
     puts hand
end


