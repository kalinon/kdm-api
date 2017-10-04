class CreateResourceTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_types do |t|
      t.string :name
      t.string :safe_name, index: true
      t.string :color
      t.belongs_to :expansion, foreign_key: true

      t.timestamps
    end
  end
end
