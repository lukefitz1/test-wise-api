class Feature < ApplicationRecord
  belongs_to :project, optional: true

  has_many :scenarios
end
