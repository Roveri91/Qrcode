class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :surname
      t.string :linkedln
      t.date :birthday

      t.timestamps
    end
  end
end
