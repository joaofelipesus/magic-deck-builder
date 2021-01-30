class CreateDecks < ActiveRecord::Migration[6.1]
  def change
    create_table :decks, id: :uuid do |t|
      t.string :name
      t.references :owner, null: false, foreign_key: { to_table: 'users' }, type: :uuid
      t.string :description

      t.timestamps
    end
  end
end
