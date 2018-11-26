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
            self.suit == other.suit
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
            @hand << @shuffled.pop() #for testing purposes i had to comment this out ..this is used to shovel cards into hand after auto populating the cards and flatten them to make deck
        end
        # card_array.each do |v| # this is used to hard code instead of auto-populating which is for the testing
        #   @hand << Card.new(v[0], v[1]) 
        # end
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
                return 1 
            end
        end
        0
    end

    def card_val_array()
        timp_arr = []
        @cards.each do |v|
            timp_arr << v.value.to_s
        end
        return timp_arr
    end
    def ready_cards()
        @val_arr = []
        @suit_arr = []
        @cards.each do |v|
            suit_arr << v.suit.to_s
            val_arr << v.value.to_s.to_i
        end
    end

    def pair()
        matcher(2) ? 1 : 0
    end

    def three_of_a_kind()
        matcher(3) ? 1: 0
    end

    def four_of_a_kind()
        matcher(4) ? 1 : 0
    end

    def full_house()
        matcher(2) && matcher(3) ? 1 : 0
    end

    def flush()
        ready_cards()
        suit_arr.uniq.count == 1 ? 1 : 0
    end

    def two_pair()
        x = card_val_array()
        y = []; is = 1; wrong = 0
        x.each do |v|
            x.count(v) == 2 ?  y << v : 0
        end
        z = x.select { |k| y[0] != k} 
        z.each do |v|
            z.count(v) == 2 ? y << is : y << wrong 
        end
        return y.include?(1) == true ? 1 : 0
    end

    def straight()
        ready_cards()
        val_arr.sort.each_cons(2).all? {|x,y| y == x + 1} == true ? 1 : 0
    end

    def straight_flush()
        straight() && flush() == 1 ? 1 : 0

    end

    def hi_hand(hand)
        ready_cards()
        return @val_arr.sort.join.to_i
    end

    def ranks()
        ready_cards()
        [straight_flush(), four_of_a_kind(), full_house(), flush(), straight(), three_of_a_kind(), two_pair(), pair(), hi_hand(val_arr)].join
    end
    def game_play()
        z = Deck.new
        @player1 = z.deal_hand(@cards)
        @player2 = z.deal_hand(@cards)
        if @player1.ranks() > @player2.ranks()
            return "player 1 wins"
        elsif @player2.ranks() > @player1.ranks()
            return "player 2 wins"
        else 
            return "it's a tie"
        end
        ranks(@player1, @player2)
    end
    attr_reader :player1
    attr_reader :player2
    attr_reader :cards
    attr_reader :suit_arr
    attr_reader :val_arr
end
# d = Deck.new
# player1 = d.deal_hand(@cards); puts player1.ranks()
# puts "------"
# player2 = d.deal_hand(@cards); puts player2.ranks()



