module ApplicationHelper
	
	def login_helper estilo = ""
	     if current_user.is_a?(UsuarioInvitado) 
	        (link_to "Register", new_user_registration_path, class: estilo) + " ".html_safe +
	     	(link_to "Login", new_user_session_path, class: estilo)
	     else
	        link_to "Logout", destroy_user_session_path, method: :delete , class: estilo
	     end
	end

	def fuente_helper(layout_name)
    	if session[:fuente]
    		saludo = "Gracias por visitarme a través de #{session[:fuente]} y estás en el layout: #{layout_name}"
    		content_tag(:p, saludo, class: "fuente-saludo")
    	end
	end

end
