class Cards
    def initialize(value, suit)
    end
    CARDVAL = %i[2 3 4 5 6 7 8 9 10 11 12 13 14]; CARDSUIT = %i[Spades Clubs Diamonds Hearts]
    Card = Struct.new(:value, :suit) do
        def to_s() 
            "#{value.capitalize} of #{suit.capitalize}"
        end
        def ==(other)
            self.value == other.value
        end
    end
    attr_reader :Card
end

class Deck < Cards
    def initialize()
    @hand = []
    @deck = CARDVAL.flat_map { |value| CARDSUIT.map{|suit| Card.new(value, suit)}} 
    @shuffled = @deck.shuffle
    end
    
    def deal_hand(card_array)
        @hand = Hand.new
        5.times do
            #  @hand << @shuffled.pop() #for testing purposes i had to comment this out ..this is used to shovel cards into hand after auto populating the cards and flatten them to make deck
        end
        card_array.each do |v| # this is used to hard code instead of auto-populating which is for the testing
          @hand << Card.new(v[0], v[1]) 
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

    def matcher(holder) 
        tmp_arr = []
        @cards.each do |v|
            tmp_arr << v.value.to_s
        end
        tmp_arr.each do |v|
            if tmp_arr.count(v) == holder
                return true
            end
        end
        false
    end

    def card_val_array()
        timp_arr = []
        @cards.each do |v|
            timp_arr << v.value.to_s
        end
        return timp_arr
    end

    def pair()
        matcher(2)
    end

    def three_of_a_kind()
        matcher(3)
    end

    def four_of_a_kind()
        matcher(4)
    end

    def two_pair()
        x = card_val_array()
        y = []; is = true; wrong = false
        x.each do |v|
            x.count(v) == 2 ?  y << v : false
        end
        z = x.select { |k| y[0] != k} 
        z.each do |v|
            z.count(v) == 2 ? y << is : y << wrong 
        end
        return y.include?(true)
    end

    ranks = {straight_flush: 8, four_of_a_kind: 7, full_house: 6,
             flush:5, straight: 4, three_of_a_kind: 3,
             two_pair: 2, pair: 1, craphand: 0
    }.freeze
    attr_reader :cards
end
# d = Deck.new
# white = d.deal_hand(); puts white
# puts "------"
# black = d.deal_hand(); puts black



