class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.integer :age
      t.string :gender
      t.text :looking_for
      t.text :bio
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
