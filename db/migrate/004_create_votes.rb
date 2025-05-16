# db/migrate/004_create_votes.rb
class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :user,   null: false, foreign_key: true
      t.references :choice, null: false, foreign_key: true

      t.timestamps
    end

    add_index :votes, [ :user_id, :choice_id ], unique: true # prevent duplicate
  end
end
