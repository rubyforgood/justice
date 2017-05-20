class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # TODO: decide which Devise modules we do and don't need
  # YES to database_authenticatable, validateable, recoverable
  # MAYBE registerable, rememberable,  confirmable
  # NO PROBABLY trackable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lessons

  def full_name
    first_name + " " + last_name
  end
end
