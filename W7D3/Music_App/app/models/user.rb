class User < ApplicationRecord
    #FIGVAPER
    validates :username, presence: true, uniqueness: true       #V
    validates :password_digest, presence: true
    validates :password, length: {minimum: 6}, allow_nil: true
    validates :session_token, presence: true, uniqueness: true

    after_initialize :ensure_session_token          #A
    attr_reader :password

    def self.find_by_credentials(username, password) #F
        user = User.find_by(username: username)
        return nil if user.nil?
        user.is_password?(password)? user : nil
    end

    def self.generate_session_token                 #G
        SecureRandom.urlsafe_base64(16)
    end

    def is_password?                                   #I
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def password=(password)                     #P
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def reset_session_token!
        self.session_token = self.generate_session_token
        self.save!
        self.session_token
    end

    private
    def ensure_session_token
        self.session_token ||= self.generate_session_token
    end
end