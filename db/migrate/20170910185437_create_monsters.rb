class CreateMonsters < ActiveRecord::Migration[5.1] #:nodoc:
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :safe_name, index: true
      t.boolean :is_quarry
      t.boolean :is_nemesis
      t.boolean :is_unique
      t.belongs_to :expansion, foreign_key: true

      t.timestamps
    end
  end
end
