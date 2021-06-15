require 'json'
module Convertions
	def self.currency_exchange(cur1, cur2, amount)
		@db = self.db
		if (!@db[cur1].nil? && !@db[cur1][cur2].nil?) # A->B
			rate = @db[cur1][cur2]
		elsif (!@db[cur2].nil? && !@db[cur2][cur1].nil?) # B->A
			rate = 1 / @db[cur2][cur1]
		else
			p "conversion rates not set"
			return nil
		end

		return (amount * rate).round(2)
	end

	def self.conversion_rates(unit, rates)
    self.db
    @db = Hash.new if @db.nil? #no conversions given yet
    @db[unit] = Hash.new if @db[unit].nil? #new unit conversion

    rates.each { |rate| @db[unit][rate[0]] = rate[1] }

    File.open(self.rates_file_path,"w") do |f|
      f.write(@db.to_json)
    end
    return @db
  end

  def self.db
    @db ||= begin
      file = File.open self.rates_file_path
      data = JSON.load file
    end
  end

  def self.rates_file_path
    this_file = File.expand_path(File.dirname(__FILE__))
    return rate_file = File.join(this_file, 'rates.json')
  end

end