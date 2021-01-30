# frozen_string_literal: true

class CreateCardDecks < ActiveRecord::Migration[6.1]
  def change
    create_table :card_decks, id: :uuid do |t|
      t.references :card, null: false, foreign_key: true, type: :uuid
      t.references :deck, null: false, foreign_key: true, type: :uuid
      t.references :version_added, null: false, foreign_key: { to_table: 'deck_versions' }, type: :uuid

      t.timestamps
    end
  end
end
