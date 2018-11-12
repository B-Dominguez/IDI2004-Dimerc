# frozen_string_literal: true

json.array! @searches, partial: 'search/search', as: :search
