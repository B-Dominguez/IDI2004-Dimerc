class Itinerario < ApplicationRecord

	def self.search(term)
	  if term
	    where('nombre LIKE ?', "#{term}").order('id DESC')
	  else
	    order('id DESC')
	  end
	end
end
