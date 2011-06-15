class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username, :last_name, :first_name, :middle_name, :birthdate, :status, :admin, :role_id
  
  validates_inclusion_of :status, :in => %w(Active Inactive Locked)
  
  has_one :role
  has_and_belongs_to_many :projects
  has_many :tickets
  
  before_create :admin_role
  
  def admin_role
    self.role_id = 0 if self.admin?
  end
  
end
