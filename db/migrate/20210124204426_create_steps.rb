class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps, id: :uuid do |t|
      t.string :keyword
      t.text :step

      t.timestamps
    end
  end
end
