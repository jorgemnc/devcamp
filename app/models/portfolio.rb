class Portfolio < ApplicationRecord

has_many :technologies

accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }


#Incluyendo el metodo helper creado en Concerns/Placeholder para la url de las imagenes
	include Placeholder

validates_presence_of :title, :body, :main_image, :thumb_image

#Los scopes son querys que están programadas en el modelo y no en el controlador.
#De esta manera, se pueden llamar desde el controlador como un metodo:

#Dos maneras de crear scopes
#1:
def self.angular
	where(subtitle: "Angular")
end
#2:
scope :ruby_on_rails_portfolio_items, -> {
	where(subtitle: "Ruby on Rails")
}


#Para setear valores por defecto en las variables
#El primer metodo es hacerlo en la migracion, como con el enum, pero es complicado si lo quiero modificar después
#El segundo metodo es usando un callback en el metodo:
after_initialize :setear_valores

def setear_valores
	self.main_image ||= Placeholder.generador_de_imagen(alto: "600", ancho: "400")
	self.thumb_image ||= Placeholder.generador_de_imagen(alto: "350", ancho: "200")
end


end


