class ApplicationController < ActionController::Base
	
	protect_from_forgery with: :exception

	#Este es un concern:
	include DeviseListaBlancaConcern
	#OJO: EL INSTRUCTOR RECOMIENDA IMPLEMENTAR LOS CONCERNS AL FINAL, YA QUE ASÍ ES MÁS FÁCIL DEBBUGEAR
	#Recuerda que los concerns son solo módulos para organizar el código.

	#Para leer parámetros de la url con ?
	#Usaré otro concern:
	include SetFuenteConcern	

	#Para trabajar con personas no logeadas
	#Usaré otro concern
	#El concern usa lo que se conoce como "nill object pattern"
	include CurrentUserConcern

	#Concern para modificar el titulo de las paginas y otros datos del layout
	include DefaultPageContentConcern


	#Hacer refactor de este codigo
	#Era solo para el capitulo de hacer una gema y no debe ir acá
	before_action :set_copyright

	def set_copyright
	 @copyright = DevcampViewTool::Renderer.copyright "Jorge Nuñez", "Todos los derechos reservados"
	end

	module DevcampViewTool
		class Renderer
			def self.copyright name, msg
				"&copy; #{Time.now.year} | <b>#{name} #{msg}</b>".html_safe
			end
		end
	end


end

