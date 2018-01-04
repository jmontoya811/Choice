require "administrate/base_dashboard"

class PostDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    class_roster: Field::BelongsTo,
    id: Field::Number,
    title: Field::String,
    name: Field::String,
    age: Field::Number,
    body: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    class_desired: Field::String,
    status: Field::String.with_options(searchable: false),
    slug: Field::String,
    gender: Field::String.with_options(searchable: false),
    timeslot: Field::String.with_options(searchable: false),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :class_roster,
    :id,
    :title,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :class_roster,
    :id,
    :title,
    :name,
    :age,
    :body,
    :created_at,
    :updated_at,
    :class_desired,
    :status,
    :slug,
    :gender,
    :timeslot,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :class_roster,
    :title,
    :name,
    :age,
    :body,
    :class_desired,
    :status,
    :slug,
    :gender,
    :timeslot,
  ].freeze

  # Overwrite this method to customize how posts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(post)
  #   "Post ##{post.id}"
  # end
end
