require "administrate/base_dashboard"

class TravelInfoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    project: Field::BelongsTo.with_options(searchable: true)
    id: Field::Number,
    hotel_name: Field::String,
    address: Field::String,
    city: Field::String.with_options(searchable: true)
    zip: Field::String,
    state: Field::String,
    phone: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :project,
    :hotel_name,
    :address,
    :city
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :project,
    :id,
    :hotel_name,
    :address,
    :city,
    :zip,
    :state,
    :phone,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :project,
    :hotel_name,
    :address,
    :city,
    :zip,
    :state,
    :phone,
  ].freeze

  # Overwrite this method to customize how travel infos are displayed
  # across all pages of the admin dashboard.
  #
  #def display_resource(travel_info)
   # "TravelInfo ##{travel_info.id}"
  #end
end
