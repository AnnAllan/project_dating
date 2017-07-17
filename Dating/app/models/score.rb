class Score < ApplicationRecord
  has_many :users
  has_many :partner_ids
end
