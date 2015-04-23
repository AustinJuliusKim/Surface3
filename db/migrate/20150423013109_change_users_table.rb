class ChangeUsersTable < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.string :full_name
  		t.integer :age
  		t.string :gender
  		t.text :looking_for
  		t.text :bio
  	end
  end
end
