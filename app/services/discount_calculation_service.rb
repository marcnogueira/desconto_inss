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
    salary_ranges.keys.each do |band|
      instance_variable_set(
        ('@' + band.to_s),
        ChainedCalculation.new(salary_ranges[band])
      )
    end
  end

  def define_chained_relations
    regex = /\b\w+_band\b/
    bands = instance_variables.select{|v| v.match(regex)}
    bands.each_cons(2) do |band, next_band|
      break if band == bands.last
      eval(band.to_s).next_band = eval(next_band.to_s)
    end
  end
end
