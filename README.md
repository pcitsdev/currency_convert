# CurrencyConvert

Basic currency conversion and operations

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'currency_convert', git: "git://github.com/pcitsdev/currency_convert"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ git clone https://github.com/pcitsdev/currency_convert.git
    $ cd currency_convert
    $ gem build currency_convert.gemspec
    $ gem install currency_convert-0.1.0.gem

## Usage

--Dummy rates are added with the gem. To update/change rates use command
```ruby
CurrencyConvert::Money.conversion_rates('EUR', {'USD' => 1.11,'Bitcoin' => 0.0047})
```
Here "EUR" is a base currency and "USD", "Bitcoin" are the conversion rates for the base currency
Note: Enter rates in hash format

--To create a currency object
```ruby
fifty_eur = CurrencyConvert::Money.new(50, 'EUR')
```
This creates an object with currency "EUR" and amount 50
```ruby
fifty_eur.amount   # => 50
fifty_eur.currency # => "EUR"
fifty_eur.inspect  # => "50.00 EUR"
```
--Conversions
```ruby
fifty_eur.convert_to('USD') # => 55.50 USD
```
Here "USD" rate should be updated to get the correct conversion amount

--Arithmetics operations
	Examples:
```ruby
twenty_dollars = CurrencyConvert::Money.new(20, 'USD')
fifty_eur + twenty_dollars # => 68.02 EUR
fifty_eur - twenty_dollars # => 31.98 EUR
fifty_eur / 2              # => 25 EUR
twenty_dollars * 3         # => 60 USD
```
Note: the final result will be in the currency used as first operand

--Coditional operations
```ruby
twenty_dollars == CurrencyConvert::Money.new(20, 'USD') # => true
twenty_dollars == CurrencyConvert::Money.new(30, 'USD') # => false

fifty_eur_in_usd = fifty_eur.convert_to('USD')
fifty_eur_in_usd == fifty_eur          # => true

twenty_dollars > CurrencyConvert::Money.new(5, 'USD')   # => true
twenty_dollars < fifty_eur             # => true
```
-- Note
	If any conversion is not defined it will display message.
```ruby
"conversion rates not set"
```
So update rates accordingly.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pcitsdev/currency_convert.
