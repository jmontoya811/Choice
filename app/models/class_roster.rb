class ClassRoster < ApplicationRecord
   validates_presence_of :title, :subtitle, :count, :description
end
