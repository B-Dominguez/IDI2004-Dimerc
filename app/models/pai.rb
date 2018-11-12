class Pai < ApplicationRecord
	has_many :ciudads, dependent: :delete_all
	before_save :default_values

	def default_values
		self.suscriptores = 0 if self.suscriptores.nil?
	end

	def self.search(term)
	  if term
	    where('nombre LIKE ?', "#{term}").order('id DESC')
	  else
	    order('id DESC')
	  end
	end
end
