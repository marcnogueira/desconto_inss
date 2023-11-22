# frozen_string_literal: true

class DiscountCalculationService
  attr_reader :discount, :salary, :aliquot, :salary_band

  # TODO: criar as classes de faixa salarial automaticamente a partir de um arquivo de configuração
  def initialize(salary)
    @salary = salary.to_f
    @first_band = FirstSalaryBand.new
    @second_band = SecondSalaryBand.new
    @third_band = ThirdSalaryBand.new
    @fourth_band = FourthSalaryBand.new

    @first_band.next_band = @second_band
    @second_band.next_band = @third_band
    @third_band.next_band = @fourth_band
    @discount, @aliquot, @salary_band = @first_band.calculate(@salary, 0)
  end
end
