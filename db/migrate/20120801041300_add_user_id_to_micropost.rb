class AddUserIdToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :user_id, :integer
  end
end
