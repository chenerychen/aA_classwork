class User < ApplicationRecord
    validates :user_name, presence: true, uniqueness: true
    validates :password_digest, presence: true

    after_initialize :ensure_session_token

    def self.find_by_credentials(user_name, password) 
        user = User.find_by(user_name: user_name)
        return nil if user.nil? 
        user.is_password?(password) ? user : nil 
    end 


    def reset_session_token! 
      self.session_token = SecureRandom::urlsafe_base64(10)  
      self.save!
      #session_token is an attributes of the cookie or user. 
      #session[:session_token] cookie
      #user[:session_token] 
    end 

    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password) 
    end


    def is_password?(password) # 'hunter12'
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
    
    #$2a$10$~~~~~~~~~~~~~.0000000000000
    

    private

    def ensure_session_token
      self.session_token ||= SecureRandom::urlsafe_base64(10)
    end
    
end




#before_validation -> run this method prior to saving a user in the database;
# BEFORE VALIDATING

# after_initialization -> run this method after you create a new user
# AFTER INITIALIZE

