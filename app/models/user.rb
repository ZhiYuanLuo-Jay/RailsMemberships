class User < ActiveRecord::Base
  has_secure_password

  has_many :memberships, dependent: :destroy #

  has_many :groups, dependent: :destroy
  has_many :have_groups, through: :memberships, source: :groups
  

  validates :first_name, :last_name, presence: true
  validates :email,  :presence => true, uniqueness: { case_sensitive: false }, length: { in: 5..100 }

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  # validates :branch, :street, :city,  :state, presence: true
  # validates :age, presence: true, numericality: true
  # validates_numericality_of :age, greater_than: 10, less_than:150

end
