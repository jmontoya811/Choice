class Post < ApplicationRecord
    enum status: { pending: 0, approved: 1 }
    enum gender: { male: 0, female: 1 }
    enum timeslot: { morning: 0, afternoon: 1 }
    extend FriendlyId
    friendly_id :title, use:  :slugged 

    validates_presence_of :title, :name, :age, :body, :class_desired, :gender
    belongs_to :user
    belongs_to :class_roster
end
