class AddAmountToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :amount, :integer
  end
end
