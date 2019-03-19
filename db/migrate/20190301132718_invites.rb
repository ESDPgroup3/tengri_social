class Invites < ActiveRecord::Migration[5.2]
  create_table :invites do |t|
    t.references :inviter, index: true
    t.references :invited, index: true
    t.boolean :status, defaulte: false
  end
end
