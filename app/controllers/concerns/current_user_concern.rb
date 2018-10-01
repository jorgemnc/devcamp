module CurrentUserConcern
	
	extend ActiveSupport::Concern

	#Para trabajar con personas no logeadas
	#Sobreescribimos el metodo current_user de Devise.
	#Si existe current_user, opera de modo normal, sino, crea un usuario invitado al vuelo con Openstruct sin modificar la base de datos.
	#Ojo: current_user de devise es de CLASE "User" y OpenStruct es OpenStruct
	def current_user
		super || usuario_invitado
	end

	def usuario_invitado
		invitado = UsuarioInvitado.new
		invitado.name = "Usuario invitado"
		invitado.first_name = "Invitado"
		invitado.last_name = "Usuario"
		invitado.email = "guest@example.com"
		invitado
	end

end
