class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  has_many :comments
  has_many :votes
  has_many :articles, :through => :votes

  validates :name, uniqueness: true
  validates :name, length: { in: 3..16 }
end
