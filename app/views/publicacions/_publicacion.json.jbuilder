# frozen_string_literal: true

json.extract! publicacion, :id, :titulo, :autor, :fecha, :ciudad, :tipo, :contenido, :ptje_rep, :created_at, :updated_at
json.url publicacion_url(publicacion, format: :json)
