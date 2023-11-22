# frozen_string_literal: true

class AddCpfToIndexProponent < ActiveRecord::Migration[6.1]
  def change
    add_index :proponents, :cpf, unique: true
  end
end
