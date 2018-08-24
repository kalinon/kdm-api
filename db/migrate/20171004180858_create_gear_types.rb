class CreateGearTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :gear_types do |t|
      t.string :name
      t.string :safe_name, index: true
      t.string :color, default: '#333'
      t.string :font_color, default: '#fff'
      t.belongs_to :expansion, foreign_key: true
      t.timestamps
    end
  end
end
