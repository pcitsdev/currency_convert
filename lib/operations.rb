require 'convertions'
module Operations
    def object_converted_amount(object)
		if object.currency != currency
			Convertions::currency_exchange(object.currency, currency, object.amount)
		else
			object.amount
		end
    end

	def +(object)
		evaluate(self, "+", object)
	end

	def -(object)
		evaluate(self, "-", object)
	end

	def *(object)
		evaluate(self, "*", object)
	end

	def /(object)
		evaluate(self, "/", object)
	end

	def ==(object)
		evaluate(self, "==", object)
	end

	def <(object)
		evaluate(self, "<", object)
	end

	def >(object)
		evaluate(self, ">", object)
	end

	def evaluate(var1, op, var2)
		converted_amount = (var2.instance_of? ::CurrencyConvert::Money) ? object_converted_amount(var2) : var2
		unless converted_amount.nil?
			if ["+", "-", "*", "/"].include? op
				return var1.class.new(var1.amount.send(op, converted_amount), currency)
			elsif ["==", ">", "<"].include? op
				return var1.amount.send(op, converted_amount)
			end
		end
	end
end