class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :search_person, dependent: :destroy
  has_many :question, dependent: :destroy
  has_one_attached :image

  before_create :default_search_person
  before_create :inception

  @@row_dict = {"A"=>226, "B"=>262, "C" => 332, "D"=>372, "E"=>442, "F"=>480, "G"=>557, "H"=>599}
  @@col_dict = {"1"=> 83, "2"=> 128, "3"=>189, "4"=>313, "5"=>372, "6"=>418}

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

  def map_path
    pth= 'maps/%s.jpg'%[self.location]
  end


  def inception
    first_image  = MiniMagick::Image.new("app/assets/images/map.jpg")
    second_image = MiniMagick::Image.new("app/assets/images/pin.jpg")
    loc_x = self.location[1]
    loc_y = self.location[0]
    pos_x = @@col_dict[loc_x] - 50
    pos_y = @@row_dict[loc_y] - 143
    result = first_image.composite(second_image) do |c|
      c.compose "Over"    # OverCompositeOp
      c.geometry "+%d"%[pos_x] + "+%d"%[pos_y] # copy second_image onto first_image from (20, 20)
    end
    result.resize("535x535")
    result.write('app/assets/images/' + self.map_path)
  end
end
