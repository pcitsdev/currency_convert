require 'operations'

module CurrencyConvert

  class Money
  include Operations
    def initialize(amount, unit)
      @amount = amount
      @unit = unit
    end

    def amount
      @amount
    end

    def currency
      @unit
    end

    def inspect
      @amount.to_f.to_s + " " + @unit
    end

    def convert_to(new_unit)
      new_amount =  Convertions::currency_exchange(currency, new_unit, amount)
      if new_amount.nil?
        return
      else
        return self.class.new(new_amount, new_unit)
      end
    end

    def self.conversion_rates(unit, rates)
      Convertions::conversion_rates(unit, rates)
    end
  end
end


# basic commands
#################

# To add convertion rates
# CurrencyConvert::Money.conversion_rates('EUR', {'USD' => 1.11,'Bitcoin' => 0.0047})

# Define objects

# fifty_eur = CurrencyConvert::Money.new(50, 'EUR')
# twenty_dollars = CurrencyConvert::Money.new(20, 'USD')

#Operations

# fifty_eur op twenty_dollars
# where op can be [+, -, *, /, ==, <, >]

# fifty_eur op `int/float value`
# where op can be [+, -, *, /]