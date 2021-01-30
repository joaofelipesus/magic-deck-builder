# frozen_string_literal: true

class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards, id: :uuid do |t|
      t.string :name
      t.string :external_id
      t.text :types, array: true, default: []
      t.string :mana_cost
      t.integer :power
      t.integer :toughness
      t.text :colors, array: true, default: []

      t.timestamps
    end
  end
end
