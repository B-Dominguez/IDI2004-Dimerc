class SearchPerson < ApplicationRecord
  belongs_to :user

  def reset
    self.area = "todas las áreas"
    self.name = ""
    self.cargo = "todos los cargos"
  end

end
