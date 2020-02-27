class Enrollment < ApplicationRecord
  belongs_to :due
  belongs_to :user
end
