class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :comment_floor
      t.integer :comment_blog_id

      t.timestamps
    end
  end
end
