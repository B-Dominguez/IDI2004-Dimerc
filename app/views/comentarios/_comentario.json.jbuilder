# frozen_string_literal: true

json.extract! comentario, :id, :pertenece, :autor, :contenido, :ptje_rep, :fecha, :created_at, :updated_at
json.url comentario_url(comentario, format: :json)
