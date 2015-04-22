class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.integer :age
      t.string :gender
      t.text :looking_for
      t.text :bio
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
