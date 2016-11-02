class Project < ApplicationRecord
    has_many :tasks
    has_many :categories
    belongs_to :user
end