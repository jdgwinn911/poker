class Deck #efficient way of technically doing a double loop and populating cards with values and suits eleminating need for a class of cards
    # need to flatten it to make the actual deck.. so that this one class will do what my two old ones used to do =)
    CARDVAL = %i[two three four five six seven eight nine ten jack queen king ace]
    CARDSUIT = %i[spades clubs diamonds hearts]
    card = Struct.new(:number, :shape)
    CARDVAL.map { |number| CARDSUIT.map{|shape| Card.new(number, shape)}}
end