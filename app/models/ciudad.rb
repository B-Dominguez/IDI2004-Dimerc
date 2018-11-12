class Ciudad < ApplicationRecord
  belongs_to :pai
  has_many :publicacions, dependent: :delete_all



  #has_many :comentarios, through: :publicacions, dependent: :delete_all

	def self.search(term)
	  if term
	    where('nombre LIKE ?', "#{term}").order('id DESC')
	  else
	    order('id DESC')
	  end
	end

end
