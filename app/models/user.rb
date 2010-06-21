# == Schema Information
# Schema version: 20100621113746
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#

# == Schema Information
# Schema version: 20100618161822
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#
require 'digest'

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  attr_accessor :password
  
  validates_presence_of :name, :email
  validates_length_of :name, :maximum => 50, :on => :save, :message => "Name is too long"
  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_format_of :email, :with => EmailRegex, :on => :save, :message => "Not a valid e-mail address"
  validates_uniqueness_of :email, :case_sensitive => false
  validates_confirmation_of :password, :on => :save, :message => "Passwords do not match, have you mistyped it?"
  validates_presence_of :password, :on => :save, :message => "can't be blank"
  validates_length_of :password, :within => 6..40, :on => :save, :message => "Password must be between 6 and 40 characters long"
  
  before_save :encrypt_password
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(password)
  end
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  private
  
  def encrypt_password
    self.salt = make_salt
    self.encrypted_password = encrypt(password)
  end
  
  def encrypt(string)
    secure_hash("#{salt}#{string}")
  end
  
  def make_salt
    secure_hash("#{Time.now.utc}#{password}")
  end
  
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
