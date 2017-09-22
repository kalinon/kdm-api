class CreateCauseOfDeaths < ActiveRecord::Migration[5.1]
  def change
    create_table :cause_of_deaths do |t|
      t.string :name
      t.string :safe_name, index: true
      t.column :context, :integer, default: 0
      t.belongs_to :expansion, foreign_key: true

      t.timestamps
    end
  end
end
