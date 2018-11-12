# frozen_string_literal: true

json.extract! pai, :id, :nombre, :descripcion, :suscriptores, :ubicacion, :created_at, :updated_at
json.url pai_url(pai, format: :json)
