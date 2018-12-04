class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :search_person, dependent: :destroy

  before_create :default_search_person
  def default_search_person
     self.search_person ||= SearchPerson.new
  end

  def reset_search_people
    self.search_person.reset
  end
end
