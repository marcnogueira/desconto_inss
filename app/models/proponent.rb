# frozen_string_literal: true

class Proponent < ApplicationRecord
  validates :full_name, presence: true
  validates :cpf, presence: true, cpf: true
  validates :email, presence: true, email: true
  validates :birth, presence: true, birth: true
end
