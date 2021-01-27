# frozen_string_literal: true

class CreateDeckVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :deck_versions, id: :uuid do |t|
      t.string :name
      t.string :description
      t.references :deck, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
