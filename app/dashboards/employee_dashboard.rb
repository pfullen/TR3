require "administrate/base_dashboard"

class EmployeeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    perdiems: Field::HasMany,
    expense_codes: Field::HasMany,
    roster_lists: Field::HasMany,
    id: Field::Number,
    first_name: Field::String.with_options(searchable: true),
    last_name: Field::String,
    address: Field::String,
    city: Field::String,
    state: Field::String,
    zip: Field::String,
    email: Field::String,
    phone: Field::String,
    expense_code: Field::String,
    perdiem: Field::String,
    company: Field::String,
    type: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    shift_id: Field::Number,
    roster_id: Field::Number,
    employee_lists_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :last_name,
    :first_name, 
    :phone
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :perdiems,
    :expense_codes,
    :roster_lists,
    :id,
    :first_name,
    :last_name,
    :address,
    :city,
    :state,
    :zip,
    :email,
    :phone,
    :expense_code,
    :perdiem,
    :company,
    :type,
    :created_at,
    :updated_at,
    :shift_id,
    :roster_id,
    :employee_lists_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    
   
    :first_name,
    :last_name,
    :address,
    :city,
    :state,
    :zip,
    :email,
    :phone,
   
  
   
   
  ].freeze

  # Overwrite this method to customize how employees are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(employee)
  #   "Employee ##{employee.id}"
  # end
end
