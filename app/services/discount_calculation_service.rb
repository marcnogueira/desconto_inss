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
    salary_ranges.each_key do |band|
      instance_variable_set(
        "@#{band}",
        ChainedCalculation.new(salary_ranges[band])
      )
    end
  end

  def define_chained_relations
    regex = /\b\w+_band\b/
    bands = instance_variables.select { |v| v.match(regex) }
    bands.each_cons(2) do |band, next_band|
      break if band == bands.last

      instance_variable_get(band.to_s).next_band = instance_variable_get(next_band.to_s)
    end
  end
end
