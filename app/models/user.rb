class User < ApplicationRecord
  has_secure_password
  
  def editor?
    self.role == 'editor'
  end
  
  def admin?
    self.role == 'admin'
  end
  
  before_save :capitalize_fields
  before_save :downcase_fields
  
  validates :first_name, :last_name, :email, :role, presence: true
  validates :first_name, :last_name, :length => { :minimum => 2 }
  validates :email, :length => { :minimum => 17 }
  validates :email, :uniqueness => { :message => "already taken" }
  validates :password_confirmation, :presence => true, if: -> { !password.nil? }
  validates :password, :presence => { :on => :create }, :length => { minimum: 8, allow_nil: false }
  
=begin 
  # you only need presence on create
  :presence => { :on => :create },
  # allow_nil for length (presence will handle it on create)
  :length   => { :minimum => 8, :allow_nil => true },
  # and use confirmation to ensure they always match
  :confirmation => true
=end
  
  
  def capitalize_fields
    self.first_name = first_name.split.each { |n| 
      n.capitalize! 
    }.join(' ')
    self.last_name = last_name.split.each { |n| 
      n.capitalize! 
    }.join(' ')
  end
  
  def downcase_fields
    self.email.downcase!
  end
  
end
