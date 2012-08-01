class CreateReaders < ActiveRecord::Migration
  def change
    create_table :readers do |t|
      t.string :ip
      t.integer :blog_id

      t.timestamps
    end
  end
end
