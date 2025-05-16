# db/migrate/003_create_choices.rb
class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.string     :text, null: false
      t.references :poll, null: false, foreign_key: true

      t.timestamps
    end

    add_index :choices, [ :poll_id, :text ], unique: true
  end
end
