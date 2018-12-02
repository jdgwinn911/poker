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
            @hand << @shuffled.pop()
        end
        return @hand
    end

    def manuel_hand_deal(card_array)
        @hand = Hand.new
        card_array.each do |v| 
            @hand << Card.new(v[0], v[1]) 
        end
        return @hand
    end
    attr_reader :deck
    attr_reader :shuffled
    attr_reader :hand
end

class Hand < Deck
    include Comparable 
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

    def <=>(other)
        counter = 0 
        self.each do |z|
            other.each do |x|
                z[counter] <=> x[counter]
                counter += 1
            end
        end
    end

    def ready_cards()
        @val_arr = []
        @suit_arr = []
        @cards.each do |v|
            suit_arr << v.suit.to_s
            val_arr << v.value.to_s.to_i
        end

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

    def matcher2(holder)
        ready_cards()
        arr = []
        val_arr.sort!.reverse!
        val_arr.each do |v|
            if val_arr.count(v) == holder
                arr << v
            end
        end
        unless arr.length == 5
            tmmp = val_arr - arr
            tmmp.sort!
            x = tmmp.length
            x.times do |v|
                arr << tmmp.pop()
            end
        end
        return arr
    end

    def card_val_array()
        timp_arr = []
        @cards.each do |v|
            timp_arr << v.value.to_s
        end
        return timp_arr
    end

    def pair()
        matcher(2)  ? 1 : 0
    end

    def pair2()
        matcher2(2)
    end

    def three_of_a_kind()
        matcher(3) ? 1: 0
    end

    def three_of_a_kind2()
        matcher2(3)
    end

    def four_of_a_kind()
        matcher(4) ? 1 : 0
    end

    def four_of_a_kind2()
        matcher2(4)
    end

    def full_house()
        matcher(2) && matcher(3) ? 1 : 0
    end

    def full_house2()
        matcher2(3)
    end

    def flush()
        ready_cards()
        suit_arr.uniq.count == 1 ? 1 : 0
    end

    def flush2()
        matcher2(1)
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

    def two_pair2()
        matcher2(2)
    end

    def straight()
        ready_cards()
        val_arr.sort.each_cons(2).all? {|x,y| y == x + 1} == true ? 1 : 0
    end

    def straight2()
        matcher2(1)
    end


    def straight_flush()
        straight() == 1 && flush() == 1 ? 1 : 0
    end

    def straight_flush2()
        matcher2(1)
    end

    def setup_hi()
        z = ranks().split('')
        counter = 0 
        z.each_with_index do |v, i|
            if v == "1"; break
            else; counter += 1
            end 
        end
        high_hand = [straight_flush2(), four_of_a_kind2(), full_house2(), flush2(), straight2(), three_of_a_kind2(), two_pair2(), pair2(), straight2()]
        return high_hand[counter]
    end

    def ranks()
        ready_cards()
        [straight_flush(), four_of_a_kind(), full_house(), flush(), straight(), three_of_a_kind(), two_pair(), pair()].join
    end

    def game_play()
        return @player1.ranks() <=> @player2.ranks()
    end

    def hi_game_hands()
        
        p "this is player1's setup #{@player1.setup_hi()}"
        p"============="
        p "this is player2's setup #{@player2.setup_hi()}"
        @player1.setup_hi().each_with_index do |v, i|
            p v
           if v > @player2.setup_hi()[i]
            return 1
           elsif v < @player2.setup_hi()[i]
            return -1
           end
        end
        return 0

    end

    def output()
        d = Deck.new
        @player1 = d.deal_hand(hand)
        @player2 = d.deal_hand(hand)
        hsh = {1 => "player 1 wins", -1 => "player 2 wins"}
        @player1.to_s
        puts @player1.ranks()
        puts "==============="
        @player2.to_s
        puts @player2.ranks()

        if hsh.has_key?(game_play())
            return hsh[game_play()]
        elsif hsh.has_key?(hi_game_hands())
            return hsh[hi_game_hands()]
        else 
            return "it's a tie"
        end

        ash = {00000000 => "High card", 00000001 => "Pair", 00000011 => "Two Pair", 00000100 => "Three of a kind", 00001000 => "Straight", 00010000 => "Flush", 00100101 => "Full House", 01000000 => "Four of a Kind", 10000000 => "Straight Flush"}
        if ash.has_key?(ranks())
            return ash[ranks()]
        end
    end
    attr_reader :player1
    attr_reader :player2
    attr_reader :cards
    attr_reader :suit_arr
    attr_reader :val_arr
end





