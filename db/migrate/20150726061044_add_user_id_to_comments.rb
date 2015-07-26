class AddUserIdToComments < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.remove :commenter
      t.integer :user_id
    end
  end
end
