class Modifier
	def self.calculate(value)
		bonus = {
			1 => -1,
			2 => -1,
			3 => 0,
			4 => 0,
			5 => 1,
			6 => 1,
			7 => 2,
			8 => 2,
			9 => 2,
			10 => 3,
			11 => 3,
			12 => 3,
			13 => 4,
			14 => 4,
			15 => 4,
			16 => 5
		}
		
		bonus[value]
	end
end