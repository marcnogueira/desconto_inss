# frozen_string_literal: true

class Proponent < ApplicationRecord
  monetize :salary_cents, as: 'salary'
  monetize :discount_cents, as: 'discount'
  monetize :net_salary_cents, as: 'net_salary', disable_validation: true

  has_many :phones, dependent: :destroy
  has_one :address, dependent: :destroy

  validates :full_name, presence: true
  validates :cpf, presence: true, cpf: true, uniqueness: true
  validates :email, presence: true, email: true
  validates :birth, presence: true, birth: true

  enum salary_band: [:processing] + Utilities::SalariesInformation::RANGES.keys

  def net_salary
    salary - discount
  end
end
