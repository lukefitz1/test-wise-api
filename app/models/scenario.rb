class Scenario < ApplicationRecord
  belongs_to :feature, optional: true

  has_many :steps
end
