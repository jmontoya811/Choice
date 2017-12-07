class Skill < ApplicationRecord
    validates_presence_of :title, :percent_utilized

    belongs_to :class_roster
end
