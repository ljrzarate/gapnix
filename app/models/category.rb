class Category < ApplicationRecord
    has_many :tasks
    belongs_to :project
end

#User / posts / comments
#user has_many posts
#user has_many comments, through: posts