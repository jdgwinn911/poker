class Deck #efficient way of technically doing a double loop and populating cards with values and suits into a deck without having class for Cards
    CARDVAL = %i[two three four five six seven eight nine ten jack queen king ace]
    CARDSUIT = %i[spades clubs diamonds hearts]
    Card = Struct.new(:number, :shape)
    CARDVAL.flat_map { |number| CARDSUIT.map{|shape| Card.new(number, shape)}}
end