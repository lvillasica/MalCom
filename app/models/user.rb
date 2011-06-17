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
  has_many :comments
  
  before_create :admin_role
  before_save :lock_if_locked
  after_update :check_lock_status
  
  def admin_role
    self.role_id = 0 if admin?
  end
  
  def lock_if_locked
    if new_record? and status.eql? 'Locked' and locked_at.nil? and failed_attempts < 4
      self.locked_at = Time.now
      self.failed_attempts =4
    end
  end
  
  def check_lock_status
    unless locked_at.nil?
      unless status.eql? 'Locked'
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
