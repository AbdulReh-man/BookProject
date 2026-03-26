class User < ApplicationRecord
  has_many :books
  has_one :account, dependent: :destroy

  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Set default role
  after_initialize :set_default_role, if: :new_record?
  after_create :initialize_account

  # Methods to check roles manually
  def admin?
    role == 'admin'
  end

  def user?
    role == 'user'
  end

  private

  def set_default_role
    self.role ||= "user"  # Default to 'user' if no role is assigned
  end

  def initialize_account
    # Create an associated account if none exists for this user
    self.create_account!(balance: 0.0) unless self.account
  end

end
