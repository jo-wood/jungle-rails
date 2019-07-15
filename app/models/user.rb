class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  validates :name, presence: true
  validates :email, presence: true
  validates :password, :presence => true,
                        :confirmation => true, 
                        :length => {:within => 6..40}

end
