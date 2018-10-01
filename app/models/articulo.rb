class Articulo < ApplicationRecord
	
	

	validates_presence_of :titulo, :cuerpo

	enum status: {draft: 0, published:1}

	belongs_to :topic


	extend FriendlyId
	friendly_id :titulo, use: :slugged
	#En el ejemplo de la gema friendly dice: friendly_id :name, use: :slugged
	#pero en mi caso no usaré :name sino :title

	#Para setear el valor por defecto de topic_id
	after_initialize :setear_valores
	def setear_valores
		self.topic_id ||= 3
	end

end
