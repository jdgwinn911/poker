# cards,hand,deck,game rules
class Cards
    def initialize(number,shapes)
        @card_name = "#{number}#{shapes}"
        @card_value = "#{number}"
    end
    attr_reader :card_name
    
end