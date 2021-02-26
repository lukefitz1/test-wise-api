class StepSerializer < ActiveModel::Serializer
  attributes :id, :keyword, :step, :order

  belongs_to :scenario
end
