class User < ApplicationRecord
    attr_reader :password

    def password_existance
        if !self.password_digest 
            errors[:password_digest] << "Password can\'t be blank"
        end
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def find_by_credentials(username, password) 
        user = User.find_by(username: username)
        if user && BCrypt::Password.new(user.password_digest).is_password?(password)
            return user
        else
            nil
        end
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def password=(arg)
        @password = arg
        self.password_digest = BCrypt::Password.create(arg)
    end

    
    public
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: {minimum: 1, allow_nil: true}
    
    validate :password_existance

    before_validation :ensure_session_token

end
