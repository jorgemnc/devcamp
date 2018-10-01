module SetFuenteConcern
	extend ActiveSupport::Concern

#Los concerns nos permiten incluir before actions:
	included do
		before_action :set_fuente
	end

	def set_fuente
		#session es un metodo de Devise
		#Leeré el parámetro "q" en la url (ejemplo: /portfolio/11?q=twitter), pero puede ser cualquier letra o palabra
		#No necesariamente el usuario tiene que haber iniciado sesion para tener sesión. Puede ser tambien un usuario incognito.
		session[:fuente] = params[:q] if params[:q]
		#Ahora ya puedo llamar a session[:fuente] desde cualquier vista, incluso application.html.erb
		#Y puedo mantener el parámetro "q" de manera persistente
	end

end
