class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :region

  has_many :workshops

  before_validation :default_role

  validates :role, presence: true

  def default_role
    self.role = "user" if role.nil?
  end
end
