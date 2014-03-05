class ServerConfig < ActiveRecord::Base
	def self.encounter_rate(server)
		self.where(key: 'encounter_rate', server: server).first.value
	end
	
	def self.resale_rate(server)
		self.where(key: 'resale_rate', server: server).first.value
	end		
end
