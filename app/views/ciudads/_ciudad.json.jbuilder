# frozen_string_literal: true

json.extract! ciudad, :id, :nombre, :descripcion, :ubicacion, :pais, :created_at, :updated_at
json.url ciudad_url(ciudad, format: :json)
