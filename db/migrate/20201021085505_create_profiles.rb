class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.string :name, null: false, default: ""
      t.string :user_name, null: false, default: ""
      t.text :web
      t.text :introduce
      t.string :gender
      t.integer :number
      t.timestamps
    end
  end
end
