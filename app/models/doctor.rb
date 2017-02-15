class Doctor < ApplicationRecord
  validates_presence_of :first_name, :last_name

  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
end
