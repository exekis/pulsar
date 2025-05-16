# db/migrate/002_create_polls.rb
class CreatePolls < ActiveRecord::Migration[7.0]
  def change
    create_table :polls do |t|
      t.string     :title, null: false
      t.references :user,  null: false, foreign_key: true

      t.timestamps
    end

    add_index :polls, :title
  end
end