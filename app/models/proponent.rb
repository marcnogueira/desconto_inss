# frozen_string_literal: true

class Proponent < ApplicationRecord
  has_many :phones, dependent: :destroy
  has_one :address, dependent: :destroy

  validates :full_name, presence: true
  validates :salary, presence: true
  validates :cpf, presence: true, cpf: true
  validates :email, presence: true, email: true
  validates :birth, presence: true, birth: true
end
