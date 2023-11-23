# frozen_string_literal: true

class CreateProponents < ActiveRecord::Migration[6.1]
  def change
    create_table :proponents do |t|
      t.string :full_name
      t.string :email
      t.date :birth
      t.string :cpf
      t.monetize :salary
      t.monetize :discount, amount: { default: 0.0 }
      t.integer :salary_band, default: 0

      t.timestamps
    end
  end
end
