class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features, id: :uuid do |t|
      t.text :description

      t.timestamps
    end
  end
end
