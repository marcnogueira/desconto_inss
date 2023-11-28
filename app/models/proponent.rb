# frozen_string_literal: true

class Proponent < ApplicationRecord
  paginates_per 5
  monetize :salary_cents, as: 'salary'
  monetize :discount_cents, as: 'discount'
  monetize :net_salary_cents, as: 'net_salary', disable_validation: true
  before_validation :parse_cpf
  after_save :calcule_salary_discount

  scope :in_process, -> { where(salary_band: :processing) }
  scope :by_salary_band, ->(salary_band) { where(salary_band: salary_band) }

  has_many :phones, dependent: :destroy
  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones

  validates :full_name, presence: true
  validates :cpf, uniqueness: true, presence: true, cpf: true
  validates :email, presence: true, email: true
  validates :birth, presence: true, birth: true

  enum salary_band: [:processing] + Utilities::SalariesInformation::RANGES.keys

  def net_salary
    salary - discount
  end

  def parse_cpf
    self.cpf = Utilities::Cpf.only_numbers cpf
  end

  def calcule_salary_discount
    GetDiscountJob.perform_now(id)
  end
end
