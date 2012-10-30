class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  has_many :lend_records
  has_many :authentications
  validates_presence_of :password, on: :create
  before_create {generate_token(:auth_token)}

  def add_auth(auth)
    authentications.create(provider: auth[:provider], uid: auth[:uid])
  end

  class << self
    def from_auth(auth)
      locate_auth(auth) || locate_email(auth) || create_user(auth)
    end

    def locate_auth(auth)
      Authentication.find_by_provider_and_uid(auth[:provider], auth[:uid]).try(:user)
    end

    def locate_email(auth)
      user = find_by_email(auth[:info][:email])
      return unless user
      user.add_auth(auth)
      user
    end

    def create_user(auth)
      user = create!(name: auth[:info][:nickname],
                     email: auth[:info][:email],
                     password: Time.now.to_s)
      user.add_auth
      user
    end
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver

  end

end
