class ServerConfig < ActiveRecord::Base
	def self.encounter_rate(server)
		self.where(key: 'encounter_rate', server: server).first.value
	end
end
