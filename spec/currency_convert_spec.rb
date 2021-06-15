require "currency_convert.rb"

RSpec.describe(CurrencyConvert) do
  it "creates an object for 50 EUR" do
    money = CurrencyConvert::Money.new(50, 'EUR')
    expect(money.amount).to eq(50)
    expect(money.currency).to eq('EUR')
  end
  it "updates/ sets conversion rates" do
    CurrencyConvert::Money.conversion_rates('EUR', {'USD' => 1.11,'Bitcoin' => 0.0047})
  end
  it "converts 1 EUR to USD" do
    money = CurrencyConvert::Money.new(1, 'EUR')
    converted_money = money.convert_to("USD")
    expect(converted_money.currency).to eq('USD')
    expect(converted_money.amount).to eq(1.11)# based on the rates given above, update rates accordingly
  end
  it "converts 1 EUR to Bitcoin" do
    money = CurrencyConvert::Money.new(100, 'EUR')
    converted_money = money.convert_to("Bitcoin")
    expect(converted_money.currency).to eq('Bitcoin')#Only upto 2 decimal points
    expect(converted_money.amount).to eq(0.47)# based on the rates given above, update rates accordingly
  end
  it "conducts addition and substarction (final currency is EUR)" do
    fifty_eur = CurrencyConvert::Money.new(50, 'EUR')
    twenty_dollars = CurrencyConvert::Money.new(20, 'USD')
    add_money = fifty_eur + twenty_dollars
    sub_money = fifty_eur - twenty_dollars
    expect(add_money.amount).to eq(68.02)#  based on the rates given above, update rates accordingly
    expect(add_money.currency).to eq("EUR")

    expect(sub_money.amount).to eq(31.98)#  based on the rates given above, update rates accordingly
    expect(sub_money.currency).to eq("EUR")
  end
  it "Multiplying integer" do
    twenty_dollars = CurrencyConvert::Money.new(20, 'USD')
    mult_money = twenty_dollars * 3
    expect(mult_money.amount).to eq(60)
    expect(mult_money.currency).to eq("USD")
  end
  it "Dividing integer" do
    twenty_dollars = CurrencyConvert::Money.new(20, 'USD')
    mult_money = twenty_dollars / 2
    expect(mult_money.amount).to eq(10)
    expect(mult_money.currency).to eq("USD")
  end
  it "comapares money" do
    fifty_eur = CurrencyConvert::Money.new(50, 'EUR')
    fifty_eur_in_usd = fifty_eur.convert_to('USD')
    twenty_dollars = CurrencyConvert::Money.new(20, 'USD')
    expect(fifty_eur == fifty_eur_in_usd).to eq(true)
    expect(fifty_eur_in_usd == twenty_dollars).to eq(false)
    expect(fifty_eur_in_usd > (fifty_eur_in_usd * 2)).to eq(false)
    expect(fifty_eur_in_usd < (fifty_eur_in_usd * 2)).to eq(true)
  end
end

