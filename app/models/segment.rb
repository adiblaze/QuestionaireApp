class Segment < ApplicationRecord

  resourcify

  belongs_to :exam

  has_many :questions
end
