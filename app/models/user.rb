require 'mongoid'

class User
  include Mongoid::Document 
  include Mongoid::Timestamps

  attr_accessor :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  field :name
  field :email
  field :password_hash
  field :password_salt
  field :is_admin, :type => Boolean, :default => false

  has_many :comments

  before_save :encrypt_password

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = where(:email => email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def to_json(*args)
    super :only => [:id, :email, :created_at, :updated_at]
  end

  def is_admin?
    self.is_admin
  end

  def is_guest?
    false
  end

  def is_user?
    true
  end
end