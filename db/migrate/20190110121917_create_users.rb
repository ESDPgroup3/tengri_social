class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :first_name
      t.string :surname
      t.date :birthday

      t.timestamps
    end
  end
end
