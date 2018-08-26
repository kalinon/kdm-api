class CreateSurvivalActions < ActiveRecord::Migration[5.1] #:nodoc:
  def change
    create_table :survival_actions do |t|
      t.string :name
      t.string :safe_name

      t.timestamps
    end
  end
end
