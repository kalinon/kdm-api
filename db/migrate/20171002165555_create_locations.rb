class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :safe_name, index: true
      t.string :color
      t.string :font_color
      t.belongs_to :expansion, foreign_key: true

      t.timestamps
    end
  end
end
