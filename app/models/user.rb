# frozen_string_literal: true

# Class for modeling users
class User < ApplicationRecord
  attr_accessor :password_confirmation
  validates :username, presence: true, length: { maximum: 15 }, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def self.digest(string)
    BCrypt::Password.create(string, cost: cost)
  end

  private

  def cost
    return BCrypt::Engine::MIN_COST if ActiveModel::SecurePassword.min_cost
    BCrypt::Engine.cost
  end
end
