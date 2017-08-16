class Roster < ApplicationRecord
  belongs_to :project 
  has_many :roster_lists, :dependent => :destroy
  has_many :shift_infos
accepts_nested_attributes_for :roster_lists ,
							   allow_destroy: true,
							   reject_if: proc {|att| att['employee_id'].blank?}


def self.search(term)

	  if term
	    where("week = ?", "%#{term}%")
	      	    
	  else
	    all
	  end
	end

							  
end
