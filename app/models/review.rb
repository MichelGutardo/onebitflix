class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :user
  
  validates :rating, presence: true, numericaly: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5}
  validates :description, presence: true, length:{minimum: 50}
  validates :user_id, uniqueness: {scope:[:reviewable_type, :reviewable_id], message: "cann add only one review per resource"}
end
