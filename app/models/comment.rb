class Comment < ApplicationRecord
    belongs_to :user, foreign_key: :profile_id
end
