class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin], multiple: false)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates_presence_of :name

  def first_name
    self.name.split.first
  end

  def last_name
    total = self.name.split.count - 1
    string = ''
    count = 0
    self.name.split.last(total).each do |s|
      count+=1

      if count == 1
        string << "#{s}"
      else
        string << " #{s}"
      end
    end
    return string
  end
end
