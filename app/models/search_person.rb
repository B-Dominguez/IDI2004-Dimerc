class SearchPerson < ApplicationRecord
  belongs_to :user

  def reset
    self.area = "todas las áreas"
    self.nombre = ""
    self.cargo = "todos los cargos"
  end

end
