module DeviseListaBlancaConcern
	extend ActiveSupport::Concern

	#Los concerns nos permiten incluir before actions:
	included do
		before_action :configure_permitted_parameters, if: :devise_controller?
	end

	def configure_permitted_parameters
    #Agregando el parametro "name" a la whitelist de Devise
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    #Devise por defecto acepta password y email
 	end

end
