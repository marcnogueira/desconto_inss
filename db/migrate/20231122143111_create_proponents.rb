# frozen_string_literal: true

class CreateProponents < ActiveRecord::Migration[6.1]
  def change
    create_table :proponents do |t|
      t.string :full_name
      t.string :email
      t.date :birth
      t.string :cpf
      t.decimal :salary, precision: 8, scale: 2
      t.decimal :discount, precision: 8, scale: 2
      t.string :salary_band

      t.timestamps
    end
  end
end
