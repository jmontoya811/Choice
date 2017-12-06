class ClassRoster < ApplicationRecord
    enum status: { Active: 0, Inactive: 1 }
    extend FriendlyId
    friendly_id :title, use:  :slugged
   validates_presence_of :title, :subtitle, :count, :description

   has_many :posts

end