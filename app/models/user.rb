class User < ApplicationRecord
  has_many :enrollments
  has_many :enrolled_dues, through: :enrollments, source: :due
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def enrolled_in?(due)
    return enrolled_dues.include?(due)
  end

end
