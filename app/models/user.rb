class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :failed_attempts, :locked_at,
                  :username, :last_name, :first_name, :middle_name, :birthdate, :status, :admin, :role_id, :id
  
  validates_inclusion_of :status, :in => %w(Active Inactive Locked)
  
  has_one :role
  has_and_belongs_to_many :projects
  has_many :tickets
  
  before_create :admin_role
  after_update :check_lock_status
  #before_update :check_unlock_status
  
  def admin_role
    self.role_id = 0 if self.admin?
  end
  
  def check_lock_status
    unless self.locked_at.nil?
      unless self.status.eql? 'Locked'
        self.status = 'Locked'
        self.update_attributes(self)
      end
    end
  end
  
  def clear_lock
    self.failed_attempts = 0
    self.locked_at = nil
    self.status = 'Active'
    self
  end
  
end
