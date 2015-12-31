class Admin < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # and :omniauthable, :confirmable, 
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :lockable, :timeoutable
end
