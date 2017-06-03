# frozen_string_literal: true

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
  validates_presence_of :first_name, :last_name, :email

  def full_name
    if first_name && last_name
      first_name + " " + last_name
    else
      "Unknown Name for User ID: #{id}"
    end
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end

end
