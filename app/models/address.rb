# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :proponent

  validates :address, presence: true
  validates :number, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :neighborhood, presence: true
  validates :uf, presence: true
end
