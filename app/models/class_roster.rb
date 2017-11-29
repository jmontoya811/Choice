class ClassRoster < ApplicationRecord
    enum status: { Morning: 0, Afternoon: 1 }
    extend FriendlyId
    friendly_id :title, use:  :slugged
   validates_presence_of :title, :subtitle, :count, :description

   has_many :posts
end
