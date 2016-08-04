class State < ApplicationRecord
  belongs_to :user
  enum state: [:great, :sad, :boring]
end
