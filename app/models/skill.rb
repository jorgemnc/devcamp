class Skill < ApplicationRecord

#Incluyendo el metodo helper creado en Concerns/Placeholder para la url de las imagenes
include Placeholder

validates_presence_of :title, :percent_utilized

#Seteando valores oor defecto al parametro badge
after_initialize :setear_valores

def setear_valores
	self.badge ||= Placeholder.generador_de_imagen(alto: "250", ancho: "250")
end


end
