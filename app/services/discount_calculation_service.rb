# frozen_string_literal: true

class DiscountCalculationService
  attr_reader :discount, :salary, :aliquot, :salary_band

  def initialize(salary)
    @salary = salary.to_f

    initialize_chained_objects
    define_chained_relations

    @discount, @aliquot, @salary_band = @first_band.calculate(@salary)
  end

  private

  def initialize_chained_objects
    salary_ranges = Utilities::SalariesInformation::RANGES
    @first_band = ChainedCalculation.new(salary_ranges[:first_band])
    @second_band = ChainedCalculation.new(salary_ranges[:second_band])
    @third_band = ChainedCalculation.new(salary_ranges[:third_band])
    @fourth_band = ChainedCalculation.new(salary_ranges[:fourth_band])
  end

  def define_chained_relations
    @first_band.next_band = @second_band
    @second_band.next_band = @third_band
    @third_band.next_band = @fourth_band
  end
end
