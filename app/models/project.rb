class Project < ApplicationRecord

	has_one :project_types
	has_many :rosters, inverse_of: :project
	has_many :travel_infos
	has_many :schedules
	has_many :states
	

	# class to combine columns to create project name
	def project_name
		company + project_type.to_s + client + store_num
	end


	def self.search(term)
	  if term
	    where('project_type LIKE ? OR client LIKE ?', "%#{term}%", "%#{term}%" )
	    
	  else
	    all
	  end
	end

end



