# cards,hand,deck,game rules
class Cards
    def initialize(number,shapes)
        @card_name = "#{number}#{shapes}"
        @card_value = "#{number}"
        @card_shapes = "#{shapes}"
    end



    attr_reader :card_name
    attr_reader :card_value
    attr_reader :card_shapes
end