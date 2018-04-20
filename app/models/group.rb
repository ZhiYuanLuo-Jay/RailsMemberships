class Group < ActiveRecord::Base
  belongs_to :user

  has_many :memberships, dependent: :destroy #
  has_many :users, through: :memberships, source: :user

  validates :name,  :presence => true , length: { in: 6..100 }
  validates :description,  :presence => true , length: { in: 11..100 }
end
