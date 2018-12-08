class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :search_person, dependent: :destroy
  has_one_attached :image

  before_create :default_search_person
  def default_search_person
     self.search_person ||= SearchPerson.new
  end

  def reset_search_people
    self.search_person.reset
  end

  def self.search(terms)
    if terms
      arr_name = where('name LIKE ?', "%#{terms[:name]}%").order('id DESC')
      if terms[:cargo] != "todos los cargos"
        arr_cargo = where('cargo LIKE ?', "%#{terms[:cargo]}%").order('id DESC')
      else
        arr_cargo = self.all
      end
      if terms[:area] != "todas las áreas"
        arr_area = where('area LIKE ?', "%#{terms[:area]}%").order('id DESC')
      else
        arr_area = self.all
      end
      arr = arr_name & arr_cargo & arr_area
    else
      self.all
    end
  end
end
