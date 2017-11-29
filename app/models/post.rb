class Post < ApplicationRecord
    enum status: { pending: 0, approved: 1 }
    extend FriendlyId
    friendly_id :title, use:  :slugged 
end
