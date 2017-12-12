class Segment < ApplicationRecord
  resourcify
  belongs_to :exam
  has_and_belongs_to_many :questions, dependent: :destroy
end
