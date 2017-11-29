class ClassRoster < ApplicationRecord
    enum status: { morning: 0, afternoon: 1 }
    extend FriendlyId
    friendly_id :title, use:  :slugged
   validates_presence_of :title, :subtitle, :count, :description

   has_many :posts
end
