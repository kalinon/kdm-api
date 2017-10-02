class CreateWeaponProficiencies < ActiveRecord::Migration[5.1]
  def change
    create_table :weapon_proficiencies do |t|
      t.string :name
      t.string :safe_name, index: true
      t.belongs_to :expansion, foreign_key: true

      t.timestamps
    end
  end
end
