class Comentario < ApplicationRecord
	before_save :default_values
	belongs_to :publicacion
	belongs_to :user
	acts_as_votable


	def default_values
		self.ptje_rep = 0 if self.ptje_rep.nil?
	end

	def self.search(term)
	  if term
	    where('autor LIKE ?', "#{term}").order('id DESC')
	  else
	    order('id DESC')
	  end
	end
end
