class Question < ApplicationRecord
  resourcify
  has_and_belongs_to_many :segments, dependent: :destroy
  has_many :choices, inverse_of: :question, dependent: :destroy
  has_many :answers, inverse_of: :question, dependent: :destroy
  #cocoon helper
  accepts_nested_attributes_for :choices, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
end
