class Post < ApplicationRecord
    enum status: { pending: 0, approved: 1 }
    extend FriendlyId
    friendly_id :title, use:  :slugged 

    validates_presence_of :title, :name, :age, :body, :class_desired

    belongs_to :class_roster
end
