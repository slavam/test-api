class User < ApplicationRecord
  has_many :orders
  belongs_to :user_state
  validates :phone, presence: true, length: { maximum: 11 },
                    uniqueness: true
  
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember_token
    # self.code_token = User.new_token
    update_attribute(:code_token, User.new_token)
  end
  
  def authenticate(token)
    (self.code_token == token)
  end
  
  def confirmated?
    self.user_state_id > 1 
  end
end
