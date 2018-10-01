module Placeholder
	extend ActiveSupport::Concern

	def self.generador_de_imagen(alto:, ancho:)
	"https://via.placeholder.com/#{alto}x#{ancho}"
	end

end