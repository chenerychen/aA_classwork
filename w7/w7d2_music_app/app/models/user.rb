class User < ApplicationRecord

    validates :email, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true 
    validates :password, length: {minimum: 6, allow_nil: true}
    
    attr_reader :password 

    after_initialize :ensure_session_token 

    def self.find_by_credentials(email, password)
        email = User.find_by(email: email)
        return email if email && user.is_password?(password)  ## can I user self here self.is_password?
        nil 
    end 

    def self.generate_session_token
        # debugger 
        SecureRandom::urlsafe_base64(16)  # set a token = SecureRandom::urlsafe_base(64)
    end 

    def reset_session_token!
        self.session_token = User.generate_session_token  ## can I do = token here? 
        self.save!
        self.session_token
    end 

    def ensure_session_token    
        self.session_token ||= User.generate_session_token ## can I do generate_session_token or token here instead? 
    end                           

    def password=(password)
        @password = password 
        self.password_digest = BCrypt::Password.create(password) 
    end 

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end 

end
