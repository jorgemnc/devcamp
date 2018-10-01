json.extract! articulo, :id, :titulo, :cuerpo, :created_at, :updated_at
json.url articulo_url(articulo, format: :json)
