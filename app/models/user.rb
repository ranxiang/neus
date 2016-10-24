class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  has_many :comments
  has_many :articles
  has_many :votes
  has_many :voted_articles, :class_name => "Vote", :through => :votes

  validates :name, length: { in: 3..20 }
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, format: { with: /\A[a-zA-Z0-9]+\z/}
end
