class RosterList < ApplicationRecord
  belongs_to :roster, optional: true
  belongs_to :employee


def self.search(term)

	  if term
	    where("week = ?", "%#{term}%")
	      	    
	  else
	    all
	  end
	end



end
