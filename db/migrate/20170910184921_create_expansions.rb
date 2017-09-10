class CreateExpansions < ActiveRecord::Migration[5.1]
  def change
    create_table :expansions do |t|
      t.string :name
      t.date :released
      t.string :color
      t.string :bg_color

      t.timestamps
    end
  end
end
