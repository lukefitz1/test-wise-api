class ScenarioSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :steps
  belongs_to :feature
end
