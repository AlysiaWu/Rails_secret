class User < ActiveRecord::Base

validates :name, :email, presence: true
  has_secure_password
  has_many :secret1s, through: :likes
  has_many :likes, dependent: :destroy
end
