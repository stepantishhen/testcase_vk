class Student < ApplicationRecord
  belongs_to :school
  belongs_to :school_class, foreign_key: 'class_id'

  validates :first_name, :last_name, :surname, presence: true
  
  before_create :generate_auth_token

  private

  def generate_auth_token
    self.auth_token = Digest::SHA256.hexdigest("#{Time.now.to_i}#{rand(1000000)}")
  end
end