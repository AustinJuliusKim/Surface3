class DropProfileTable < ActiveRecord::Migration
  def change
  	drop_table :profiles do |t|
  		t.string :full_name
  		t.integer :age
  		t.string :gender
  		t.text :looking_for
  		t.text :bio
  		t.belongs_to :user, index: false

  		t.timestamps null: false
  	end
  end
end
