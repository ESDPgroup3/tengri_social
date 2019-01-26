class AddColumsToComment < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :commentable, polymorphic: true
    add_column :comments, :parent_id, :string
    add_index :comments, :parent_id
  end
end
