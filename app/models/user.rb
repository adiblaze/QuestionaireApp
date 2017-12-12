class User < ApplicationRecord
  rolify
  has_many :exams , dependent: :destroy
  has_many :user_answers , dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name,:last_name,  presence: true
  validates_length_of :contact, presence:true, :minimum => 10, :maximum => 10

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
                   format: { with: VALID_EMAIL_REGEX },
                   uniqueness: {case_sensitive: false}

  validates :password, presence: true, length: { minimum: 8 }
end
