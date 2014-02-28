class Dice
	def self.d4
		self.generic_roll(4)
	end
	
	def self.d6
		self.generic_roll(6)
	end
	
	def self.d8
		self.generic_roll(8)
	end
	
	def self.d10
		self.generic_roll(10)
	end
	
	def self.d20
		self.generic_roll(20)
	end
	
	def self.d100
		self.generic_roll(100)
	end
	
	def self.d100f
		self.generic_roll_float(100)
	end
	
	private
	def self.generic_roll_float(value)
		result = rand*value
		Rails.logger.info "[throwing float dice] A d#{value} has been throw, the result was: #{result}"		
		result
	end
	
	def self.generic_roll(value)
		result = 1+rand(value)
		Rails.logger.info "[throwing dice] A d#{value} has been throw, the result was: #{result}"
		result
	end
end