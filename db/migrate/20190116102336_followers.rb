class Followers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.references :follower, index: true
      t.references :follow, index: true
    end
  end
end
