
class Employee < ApplicationRecord

has_many :perdiems
has_many :expense_codes
has_many :roster_lists


 def full_name
  	last_name.upcase + ", " + first_name.upcase
  end

end
