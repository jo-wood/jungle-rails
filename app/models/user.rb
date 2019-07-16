class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, case_sensitive: false
  validates :password, :presence => true,
                        :confirmation => true, 
                        :length => {:within => 6..40}

  def self.authenticate_with_credentials(email, password) 
      @user = User.find_by(email: email.downcase)
      if @user && @user.authenticate(password)
        return @user
      else
        return nil
      end
  end

end
