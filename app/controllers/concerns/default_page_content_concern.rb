module DefaultPageContentConcern
	extend ActiveSupport::Concern

	#Los concerns nos permiten incluir before actions:
	included do
		before_action :set_page_defaults
	end

	def set_page_defaults
		@page_title = "Devcamp Portfolio | Welcome to my website"
		@seo_keywords = "Portfolio Jorge Nuñez Aplicacion de prueba etc, tags, tags"
	end


end