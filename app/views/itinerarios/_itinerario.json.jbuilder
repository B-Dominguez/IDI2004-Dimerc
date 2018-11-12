# frozen_string_literal: true

json.extract! itinerario, :id, :nombre, :descripcion, :duracion, :lugares, :actividades, :created_at, :updated_at
json.url itinerario_url(itinerario, format: :json)
