class Scenario < ApplicationRecord
  belongs_to :feature, optional: true

  has_many :steps
  accepts_nested_attributes_for :steps
end
