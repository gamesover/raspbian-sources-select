# frozen_string_literal: true

class CreateSources < ActiveRecord::Migration[5.0]
  def change
    create_table :sources do |t|
      t.string :continent, null: false
      t.boolean :ipv6, null: false, default: false
      t.string :country, null: false
      t.string :mirror, null: false
      t.string :address, null: false
      t.text :issues, null: true

      t.timestamps
    end
  end
end
