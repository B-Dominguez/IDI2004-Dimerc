class Publicacion < ApplicationRecord
	before_save :default_values
	belongs_to :ciudad
	belongs_to :user
	has_many :comentarios, dependent: :delete_all
	acts_as_votable

	def default_values
		self.user = current_user if self.user.nil?
		self.ptje_rep = 0 if self.ptje_rep.nil?
	end

	def self.search(term)
	  if term
	    where('titulo LIKE ?', "#{term}").order('id DESC')
	  else
	    order('id DESC')
	  end
	end

def calcular
	self.ptje_rep = self.get_upvotes.size -  self.get_downvotes.size
end

end
