# frozen_string_literal: true

class DiscountCalculationService
  attr_reader :discount, :salary, :aliquot, :salary_band

  SALARY_RANGES = {
    first_band: { name: 'first_band', range: [0, 1045.0], aliquot: 0.075 },
    second_band: { name: 'second_band', range: [1045.01, 2089.60], aliquot: 0.09 },
    third_band: { name: 'third_band', range: [2089.61, 3134.4], aliquot: 0.12 },
    fourth_band: { name: 'fourth_band', range: [3134.41, 6101.06], aliquot: 0.14 }
  }.freeze

  def initialize(salary)
    @salary = salary.to_f

    initialize_chained_objects
    define_chained_relations

    @discount, @aliquot, @salary_band = @first_band.calculate(@salary)
  end

  private

  def initialize_chained_objects
    @first_band = ChainedCalculation.new(SALARY_RANGES[:first_band])
    @second_band = ChainedCalculation.new(SALARY_RANGES[:second_band])
    @third_band = ChainedCalculation.new(SALARY_RANGES[:third_band])
    @fourth_band = ChainedCalculation.new(SALARY_RANGES[:fourth_band])
  end

  def define_chained_relations
    @first_band.next_band = @second_band
    @second_band.next_band = @third_band
    @third_band.next_band = @fourth_band
  end
end
