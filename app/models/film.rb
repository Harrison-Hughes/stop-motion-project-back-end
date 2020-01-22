class Film < ApplicationRecord
  belongs_to :user
  has_many :frames, dependent: :destroy
end
