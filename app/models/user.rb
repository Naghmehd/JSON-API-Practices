class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy 

  validates :username, presence: true

end
