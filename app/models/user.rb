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
  STATUSES = %w[Blocked Active].freeze
  validates_presence_of :name, :status, :email
  validates_inclusion_of :status, in: STATUSES, message: " must be either Blocked or Active"

  def full_name
    if first_name && last_name
      first_name + " " + last_name
    else
      "Unknown Name for User ID: #{id}"
    end
  end
end
