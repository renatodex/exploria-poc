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
			9 => 3,
			10 => 3,
			11 => 4,
			12 => 4,
			13 => 5,
			14 => 5,
			15 => 6,
			16 => 6
		}
		
		((BigDecimal(value)/BigDecimal(2)).ceil - BigDecimal(2)).to_i
	end
end