class CreateEpithets < ActiveRecord::Migration[5.1]
  def change
    create_table :epithets do |t|
      t.string :name
      t.string :safe_name, index: true
      t.boolean :selectable, default: true
      t.string :color, default: '#fff'
      t.string :bg_color, default: '#fff'
      t.string :border_color, default: '#333'
      t.column :gender, :integer, default: nil
      t.belongs_to :expansion, foreign_key: true
      t.timestamps
    end
  end
end
