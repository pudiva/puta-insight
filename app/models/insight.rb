class Insight < ApplicationRecord
  validates :body, presence: true, length: 1..1000
end
