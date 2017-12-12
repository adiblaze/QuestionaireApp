class Exam < ApplicationRecord
  resourcify
  belongs_to :user
  has_many :segments, dependent: :destroy
end
